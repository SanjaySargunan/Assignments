CREATE DATABASE TechShop;
USE TechShop;

-- Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Address TEXT
);

-- Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Description TEXT,
    Price DECIMAL(10, 2)
);

-- Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- OrderDetails Table
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Inventory Table
CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    ProductID INT,
    QuantityInStock INT,
    LastStockUpdate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Customers Table
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address)
VALUES
(1, 'Arun', 'Kumar', 'arun.kumar@example.com', '9876543210', '123 Main Street'),
(2, 'Lakshmi', 'S', 'lakshmi.s@example.com', '9443311223', '456 Oak Avenue'),
(3, 'Ravi', 'Prakash', 'ravi.prakash@example.com', '9787654321', '789 Pine Road'),
(4, 'Meena', 'Reddy', 'meena.reddy@example.com', '9845612300', '101 Maple Lane'),
(5, 'Ramesh', 'Babu', 'ramesh.babu@example.com', '9367452189', '55 Elm Street'),
(6, 'Revathi', 'Mohan', 'revathi.mohan@example.com', '8123456789', '202 Cedar Lane'),
(7, 'Anand', 'Sharma', 'anand.sharma@example.com', '9101234567', '303 Birch Boulevard'),
(8, 'Deepa', 'Nair', 'deepa.nair@example.com', '9976543120', '404 Cherry Street'),
(9, 'Prakash', 'Raj', 'prakash.raj@example.com', '9012345678', '505 Spruce Way'),
(10, 'Harini', 'S', 'harini.s@example.com', '9870123456', '606 Fir Avenue');

-- Products Table
INSERT INTO Products (ProductID, ProductName, Description, Price)
VALUES
(1, 'Smartphone', '5G Enabled, 128GB Storage', 17999.00),
(2, 'Laptop', 'Intel i5, 8GB RAM, 512GB SSD', 54999.00),
(3, 'Smart Watch', 'Waterproof, Fitness Tracking', 2999.00),
(4, 'Bluetooth Speaker', '10W Output, Portable', 1499.00),
(5, 'Earphones', 'Noise Cancelling, Wireless', 999.00),
(6, 'LED TV', '43-inch, Smart TV with 4K', 34999.00),
(7, 'Air Conditioner', '1.5 Ton, Energy Efficient', 36999.00),
(8, 'Refrigerator', '260L, Double Door', 22999.00),
(9, 'Washing Machine', '6.5kg, Fully Automatic', 14999.00),
(10, 'Microwave Oven', '20L, Convection', 10999.00);

-- Orders Table
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
(1, 1, '2025-03-20', 54999.00),
(2, 3, '2025-03-21', 17999.00),
(3, 2, '2025-03-22', 36999.00),
(4, 5, '2025-03-23', 22999.00),
(5, 4, '2025-03-24', 1499.00),
(6, 6, '2025-03-24', 2999.00),
(7, 7, '2025-03-23', 10999.00),
(8, 8, '2025-03-21', 999.00),
(9, 9, '2025-03-20', 34999.00),
(10, 10, '2025-03-22', 17999.00);

-- OrderDetails Table
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity)
VALUES
(1, 1, 2, 1),
(2, 2, 1, 1),
(3, 3, 7, 1),
(4, 4, 8, 1),
(5, 5, 4, 2),
(6, 6, 3, 1),
(7, 7, 10, 1),
(8, 8, 5, 1),
(9, 9, 6, 1),
(10, 10, 1, 1);

-- Inventory Table
INSERT INTO Inventory (InventoryID, ProductID, QuantityInStock, LastStockUpdate)
VALUES
(1, 1, 150, '2025-03-01'),
(2, 2, 50, '2025-03-05'),
(3, 3, 200, '2025-03-10'),
(4, 4, 100, '2025-03-15'),
(5, 5, 300, '2025-03-18'),
(6, 6, 80, '2025-03-20'),
(7, 7, 60, '2025-03-22'),
(8, 8, 90, '2025-03-23'),
(9, 9, 70, '2025-03-24'),
(10, 10, 120, '2025-03-25');
