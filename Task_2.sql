-- Retrieve the names and emails of all customers
SELECT FirstName, LastName, Email
FROM Customers;

-- List all orders with their order dates and corresponding customer names
SELECT Orders.OrderID, Orders.OrderDate, Customers.FirstName, Customers.LastName
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

-- Insert a new customer record into the "Customers" table
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address)
VALUES (11, 'Aditi', 'Sharma', 'aditi.sharma@example.com', '9123456789', '707 Walnut Street');

-- Update the prices of all electronic gadgets in the "Products" table by increasing them by 10%
UPDATE Products
SET Price = Price * 1.10;

-- Delete a specific order and its associated order details
DELETE FROM OrderDetails
WHERE OrderID = 4;

DELETE FROM Orders
WHERE OrderID = 4;

-- Insert a new order into the "Orders" table
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES (11, 5, '2025-03-25', 19999.00);

-- Update the contact information of a specific customer
UPDATE Customers
SET Email = 'Raju@gmail.com', Address = '12 Gandhi nagar'
WHERE CustomerID = 3;

-- Recalculate and update the total cost of each order
UPDATE Orders
SET TotalAmount = (
    SELECT SUM(OrderDetails.Quantity * Products.Price)
    FROM OrderDetails
    JOIN Products ON OrderDetails.ProductID = Products.ProductID
    WHERE OrderDetails.OrderID = Orders.OrderID
);

-- Delete all orders and their associated order details for a specific customer
DELETE FROM OrderDetails
WHERE OrderID IN (SELECT OrderID FROM Orders WHERE CustomerID = 6);

DELETE FROM Orders
WHERE CustomerID = 6;

-- Insert a new electronic gadget product into the "Products" table
INSERT INTO Products (ProductID, ProductName, Description, Price)
VALUES (11, 'Tablet', '10-inch Display, 64GB Storage, WiFi', 13999.00);

-- Update the status of a specific order
UPDATE Orders
SET Status = 'Shipped'
WHERE OrderID = 3;

-- Task 12: Calculate and update the number of orders placed by each customer
ALTER TABLE Customers ADD OrderCount INT DEFAULT 0;

UPDATE Customers
SET OrderCount = (
    SELECT COUNT(*) FROM Orders WHERE Orders.CustomerID = Customers.CustomerID
);
