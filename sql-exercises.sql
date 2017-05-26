-- Exercise 1
SELECT CategoryName, Description
FROM Categories

-- Exercise 2
SELECT ContactName, CustomerID, CompanyName
FROM Customers
WHERE City = 'London'

-- Exercise 3
SELECT *
FROM Suppliers
WHERE ContactTitle IN ('Marketing Manager', 'Sales Representative') 
	AND Fax IS NOT NULL

-- Exercise 4
SELECT CustomerID 
FROM Orders
WHERE RequiredDate BETWEEN '1997-01-01' AND '1998-01-01'
	AND Freight <100

-- Exercise 5
SELECT CompanyName, ContactName
	FROM Customers
	WHERE ContactTitle = 'Owner'
		AND Country IN ('Mexico', 'Sweden', 'Germany')

-- Exercise 6
SELECT COUNT (Discontinued)
	FROM Products
	WHERE Discontinued = 1

-- Exercise 7
SELECT CategoryName, Description
	FROM Categories
	WHERE CategoryName LIKE 'Co%'

-- Exercise 8
SELECT CompanyName, City, Country, PostalCode
	FROM Suppliers
	WHERE Address LIKE '%rue%'
	ORDER BY CompanyName

-- Exercise 9
SELECT ProductID, Quantity
	FROM [Order Details]
	ORDER BY ProductID

-- Exercise 10
SELECT c.CompanyName, c.Address 
	FROM Customers c 
	INNER JOIN Orders o ON c.CustomerID = o.CustomerID 
	WHERE ShipVia = 1

-- Exercise 11
SELECT CompanyName, ContactName, ContactTitle, Region
	FROM Suppliers
	WHERE Region IS NOT NULL

-- Exercise 12
SELECT p.ProductName
	FROM Products p
	INNER JOIN Categories c ON p.CategoryID = c.CategoryID
	WHERE CategoryName = 'Condiments'

-- Exercise 13
SELECT c.ContactName, c.CustomerID
	FROM Customers c
	LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
	WHERE OrderID IS NULL

-- Exercise 14
INSERT INTO Shippers (CompanyName)
	VALUES ('Amazon')

-- Exercise 15
UPDATE Shippers
	SET CompanyName = 'Amazon Prime Shipping'
	WHERE CompanyName = 'Amazon'

-- Exercise 16
SELECT CompanyName, AVG(Freight) as 'Average Freight Weight' 
	FROM Shippers 
	LEFT JOIN Orders ON Orders.ShipVia=Shippers.ShipperID 
	GROUP BY CompanyName

-- Exercise 17
SELECT CONCAT (e.LastName, ', ', e.FirstName) AS DisplayName
	FROM Employees e

-- Exercise 18
INSERT INTO Customers
	VALUES ('JENNV', 'JennCo', 'Jenn King', 'Owner', '999 This Way', 'San Diego', NULL, '92105', 'USA', '(619) 867-5309', NULL)
INSERT INTO Orders
	VALUES ('JENNV', 1, GETDATE(), CONVERT(DATETIME, '05/31/2016'), NULL, 4, 200.00, 'Gimme!', '777 Come This Way', 'Indianapolis', NULL, '46202', 'USA')
INSERT INTO [Order Details] (OrderID, ProductID)
	VALUES (11078, 6)

-- Exercise 19
DELETE FROM [Order Details] WHERE OrderID = '11078'
DELETE FROM Orders WHERE OrderID = '11078'
DELETE FROM Customers WHERE CustomerID = 'JENNV'

-- Exercise 20
SELECT ProductName, UnitsInStock
	FROM Products
	WHERE UnitsInStock > 100