-- Retrieve Orders with Customer Information
SELECT Orders.OrderID, Orders.OrderDate, Orders.TotalAmount, Customers.FirstName, Customers.LastName
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

-- Total Revenue by Product
SELECT Products.ProductName, SUM(OrderDetails.Quantity * Products.Price) AS TotalRevenue
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY Products.ProductName;

-- Customers with Purchases
SELECT DISTINCT Customers.FirstName, Customers.LastName, Customers.Email, Customers.Phone
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- Most Popular Product
SELECT TOP 1 Products.ProductName, SUM(OrderDetails.Quantity) AS TotalQuantityOrdered
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY Products.ProductName
ORDER BY TotalQuantityOrdered DESC;

-- List of Products with Categories
SELECT ProductName, Description AS Category
FROM Products;

-- Average Order Value per Customer
SELECT Customers.FirstName, Customers.LastName, AVG(Orders.TotalAmount) AS AverageOrderValue
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
GROUP BY Customers.CustomerID, Customers.FirstName, Customers.LastName;

-- Order with the Highest Revenue
SELECT TOP 1 Products.ProductName, SUM(OrderDetails.Quantity) AS TotalQuantityOrdered
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY Products.ProductName
ORDER BY TotalQuantityOrdered DESC;

-- Count of Orders per Product
SELECT Products.ProductName, COUNT(OrderDetails.ProductID) AS NumberOfOrders
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY Products.ProductName;

-- Customers who Purchased a Specific Product
SELECT DISTINCT Customers.FirstName, Customers.LastName, Customers.Email, Customers.Phone
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE Products.ProductName = 'Smartphone';

-- Total Revenue Within a Date Range
SELECT SUM(Orders.TotalAmount) AS TotalRevenue
FROM Orders
WHERE Orders.OrderDate BETWEEN '2025-03-20' AND '2025-03-25';
