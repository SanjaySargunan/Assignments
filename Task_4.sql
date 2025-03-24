-- Customers without Orders
SELECT Customers.FirstName, Customers.LastName, Customers.Email
FROM Customers
WHERE Customers.CustomerID NOT IN (
    SELECT DISTINCT CustomerID FROM Orders
);

-- Total Products
SELECT COUNT(*) AS TotalProducts
FROM Products;

-- Total Revenue
SELECT SUM(Orders.TotalAmount) AS TotalRevenue
FROM Orders;

-- Average Quantity for a Category
SELECT AVG(OrderDetails.Quantity) AS AverageQuantity
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE CAST(Products.ProductName AS VARCHAR(MAX)) = 'Laptop';

-- Revenue by Specific Customer
SELECT SUM(Orders.TotalAmount) AS CustomerTotalRevenue
FROM Orders
WHERE Orders.CustomerID = 3;

-- Customer with Most Orders
SELECT TOP 1 Customers.FirstName, Customers.LastName, COUNT(Orders.OrderID) AS OrderCount
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerID, Customers.FirstName, Customers.LastName
ORDER BY OrderCount DESC;

-- Popular Product Category
SELECT TOP 1 Products.ProductName AS ProductCategory, SUM(OrderDetails.Quantity) AS TotalQuantityOrdered
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY Products.ProductName
ORDER BY TotalQuantityOrdered DESC;

-- Customer with Highest Spending
SELECT TOP 1 Customers.FirstName, Customers.LastName, SUM(Orders.TotalAmount) AS TotalSpent
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerID, Customers.FirstName, Customers.LastName
ORDER BY TotalSpent DESC;

-- Average Order Value
SELECT AVG(Orders.TotalAmount) AS AverageOrderValue
FROM Orders;

-- Order Count per Customer
SELECT Customers.FirstName, Customers.LastName, COUNT(Orders.OrderID) AS OrderCount
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerID, Customers.FirstName, Customers.LastName;
