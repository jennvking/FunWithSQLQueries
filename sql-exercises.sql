-- Exercise 1
-- Return all category names with their descriptions from the Categories table.
SELECT CategoryName, Description
FROM Categories

-- Exercise 2
-- Return the contact name, customer id, and company name of all Customers in London
SELECT ContactName, CustomerID, CompanyName
FROM Customers
WHERE City = 'London'

-- Exercise 3
-- Return all available columns in the Suppliers tables for the marketing managers and sales representatives that have a FAX number
SELECT *
FROM Suppliers
WHERE ContactTitle IN ('Marketing Manager', 'Sales Representative') 
	AND Fax IS NOT NULL

-- Exercise 4
-- Return a list of customer id's from the Orders table with required dates between Jan 1, 1997 and Jan 1, 1998 and with freight under 100 units.
SELECT CustomerID 
FROM Orders
WHERE RequiredDate BETWEEN '1997-01-01' AND '1998-01-01'
	AND Freight <100

-- Exercise 5
-- Return a list of company names and contact names of all the Owners from the Customer table from Mexico, Sweden and Germany.
SELECT CompanyName, ContactName
	FROM Customers
	WHERE ContactTitle = 'Owner'
		AND Country IN ('Mexico', 'Sweden', 'Germany')

-- Exercise 6
-- Return a count of the number of discontinued products in the Products table.
SELECT COUNT (Discontinued)
	FROM Products
	WHERE Discontinued = 1

-- Exercise 7
-- Return a list of category names and descriptions of all categories beginning with 'Co' from the Categories table.
SELECT CategoryName, Description
	FROM Categories
	WHERE CategoryName LIKE 'Co%'

-- Exercise 8
-- Return all the company names, city, country and postal code from the Suppliers table with the word 'rue' in their address. 
-- The list should ordered alphabetically by company name.
SELECT CompanyName, City, Country, PostalCode
	FROM Suppliers
	WHERE Address LIKE '%rue%'
	ORDER BY CompanyName

-- Exercise 9
-- Return the product id and the total quantities ordered for each product id in the Order Details table.
SELECT ProductID, Quantity
	FROM [Order Details]
	ORDER BY ProductID

-- Exercise 10
-- Return the customer name and customer address of all customers with orders that shipped using Speedy Express.
SELECT c.CompanyName, c.Address 
	FROM Customers c 
	INNER JOIN Orders o ON c.CustomerID = o.CustomerID 
	WHERE ShipVia = 1

-- Exercise 11
-- Return a list of Suppliers that have regions. The list should contain company name, contact name, contact title and region.
SELECT CompanyName, ContactName, ContactTitle, Region
	FROM Suppliers
	WHERE Region IS NOT NULL

-- Exercise 12
-- Return all product names from the Products table that are condiments.
SELECT p.ProductName
	FROM Products p
	INNER JOIN Categories c ON p.CategoryID = c.CategoryID
	WHERE CategoryName = 'Condiments'

-- Exercise 13
-- Return a list of customer names who have no orders in the Orders table.
SELECT c.ContactName, c.CustomerID
	FROM Customers c
	LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
	WHERE OrderID IS NULL

-- Exercise 14
-- Add a shipper named 'Amazon' to the Shippers table using SQL.
INSERT INTO Shippers (CompanyName)
	VALUES ('Amazon')

-- Exercise 15
-- Change the company name from 'Amazon' to 'Amazon Prime Shipping' in the Shippers table using SQL.
UPDATE Shippers
	SET CompanyName = 'Amazon Prime Shipping'
	WHERE CompanyName = 'Amazon'

-- Exercise 16
-- Return a complete list of company names from the Shippers table. Include freight totals rounded to the nearest whole number for each shipper 
-- from the Orders table for those shippers with orders.
SELECT CompanyName, AVG(Freight) as 'Average Freight Weight' 
	FROM Shippers 
	LEFT JOIN Orders ON Orders.ShipVia=Shippers.ShipperID 
	GROUP BY CompanyName

-- Exercise 17
-- Return all employee first and last names from the Employees table by combining the 2 columns aliased as 'DisplayName'. 
-- The combined format should be 'LastName, FirstName'.
SELECT CONCAT (e.LastName, ', ', e.FirstName) AS DisplayName
	FROM Employees e

-- Exercise 18
-- Add yourself to the Customers table with an order for 'Grandma's Boysenberry Spread'.
INSERT INTO Customers
	VALUES ('JENNV', 'JennCo', 'Jenn King', 'Owner', '999 This Way', 'San Diego', NULL, '92105', 'USA', '(619) 867-5309', NULL)
INSERT INTO Orders
	VALUES ('JENNV', 1, GETDATE(), CONVERT(DATETIME, '05/31/2016'), NULL, 4, 200.00, 'Gimme!', '777 Come This Way', 'Indianapolis', NULL, '46202', 'USA')
INSERT INTO [Order Details] (OrderID, ProductID)
	VALUES (11078, 6)

-- Exercise 19
-- Remove yourself and your order from the database.
DELETE FROM [Order Details] WHERE OrderID = '11078'
DELETE FROM Orders WHERE OrderID = '11078'
DELETE FROM Customers WHERE CustomerID = 'JENNV'

-- Exercise 20
-- Return a list of products from the Products table along with the total units in stock for each product. 
-- Include only products with TotalUnits greater than 100.
SELECT ProductName, UnitsInStock
	FROM Products
	WHERE UnitsInStock > 100