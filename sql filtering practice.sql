-- 1. Create Database
CREATE DATABASE IF NOT EXISTS northwind;

-- 2. Select Database
USE northwind;


-- ============================================
-- 3. CREATE CUSTOMERS TABLE
-- ============================================

CREATE TABLE IF NOT EXISTS Customers (
    CustomerID INT PRIMARY KEY,
    CompanyName VARCHAR(100),
    Country VARCHAR(50)
);


-- ============================================
-- 4. INSERT CUSTOMERS DATA
-- ============================================

INSERT INTO Customers (CustomerID, CompanyName, Country) VALUES
(1, 'Alfreds Futterkiste', 'Germany'),
(2, 'Ana Trujillo Emparedados', 'Mexico'),
(3, 'Antonio Moreno Taqueria', 'Mexico'),
(4, 'Around the Horn', 'UK'),
(5, 'Berglunds snabbkop', 'Sweden'),
(6, 'Blauer See Delikatessen', 'Germany'),
(7, 'Bon app', 'France'),
(8, 'Boston Crab Meat', 'USA'),
(9, 'Great Lakes Food', 'USA'),
(10, 'American Foods', 'USA'),
(11, 'Market Basket', 'USA'),
(12, 'Ocean View Traders', 'UK');


-- ============================================
-- 5. CREATE PRODUCTS TABLE
-- ============================================

CREATE TABLE IF NOT EXISTS Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    CategoryID INT,
    UnitPrice DECIMAL(10,2),
    UnitsInStock INT
);


-- ============================================
-- 6. INSERT PRODUCTS DATA
-- ============================================

INSERT INTO Products
(ProductID, ProductName, CategoryID, UnitPrice, UnitsInStock)
VALUES
(1, 'Chai', 1, 18.00, 39),
(2, 'Chang', 1, 19.00, 17),
(3, 'Aniseed Syrup', 2, 10.00, 13),
(4, 'Chef Anton Cajun Seasoning', 2, 22.00, 53),
(5, 'Grandmas Boysenberry Spread', 2, 25.00, 120),
(6, 'Uncle Bobs Organic Dried Pears', 3, 30.00, 15),
(7, 'Northwoods Cranberry Sauce', 3, 40.00, 50),
(8, 'Queso Cabrales', 4, 21.00, 22),
(9, 'Tofu', 4, 23.25, 35),
(10, 'Chocolate Biscuits', 3, 15.00, 80),
(11, 'Market Special Sauce', 2, 28.00, 70),
(12, 'Premium Coffee', 1, 35.00, 90);


-- ============================================
-- 7. CREATE ORDERDETAILS TABLE
-- ============================================

CREATE TABLE IF NOT EXISTS OrderDetails (
    OrderID INT,
    ProductID INT,
    Quantity INT
);


-- ============================================
-- 8. INSERT ORDER DETAILS
-- ============================================

INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES
(101, 1, 5),
(102, 2, 15),
(103, 3, 25),
(104, 4, 40),
(105, 5, 50),
(106, 6, 60),
(107, 7, 35),
(108, 8, 10),
(109, 9, 45),
(110, 10, 20),
(111, 11, 30),
(112, 12, 55);


-- ============================================
-- 12 FILTERING QUERIES
-- ============================================


-- QUERY 1: WHERE
-- USA ke customers

SELECT *
FROM Customers
WHERE Country = 'USA';


-- QUERY 2: WHERE
-- Price 20 se zyada wale products

SELECT ProductID, ProductName, UnitPrice
FROM Products
WHERE UnitPrice > 20;


-- QUERY 3: IN
-- USA, UK aur Germany ke customers

SELECT CustomerID, CompanyName, Country
FROM Customers
WHERE Country IN ('USA', 'UK', 'Germany');


-- QUERY 4: IN
-- Category 1, 2 ya 3 ke products

SELECT ProductID, ProductName, CategoryID
FROM Products
WHERE CategoryID IN (1, 2, 3);


-- QUERY 5: BETWEEN
-- Price 10 se 30 ke beech

SELECT ProductID, ProductName, UnitPrice
FROM Products
WHERE UnitPrice BETWEEN 10 AND 30;


-- QUERY 6: BETWEEN
-- Quantity 10 se 50 ke beech

SELECT OrderID, ProductID, Quantity
FROM OrderDetails
WHERE Quantity BETWEEN 10 AND 50;


-- QUERY 7: LIKE
-- Company name A se start hota hai

SELECT CustomerID, CompanyName
FROM Customers
WHERE CompanyName LIKE 'A%';


-- QUERY 8: LIKE
-- Company name S par end hota hai

SELECT CustomerID, CompanyName
FROM Customers
WHERE CompanyName LIKE '%s';


-- QUERY 9: LIKE
-- Company name me "market" hai

SELECT CustomerID, CompanyName
FROM Customers
WHERE CompanyName LIKE '%market%';


-- QUERY 10: WHERE + AND
-- Price 20 se zyada AND stock 50 se zyada

SELECT ProductID, ProductName, UnitPrice, UnitsInStock
FROM Products
WHERE UnitPrice > 20
AND UnitsInStock > 50;


-- QUERY 11: WHERE + OR
-- USA ya UK ke customers

SELECT CustomerID, CompanyName, Country
FROM Customers
WHERE Country = 'USA'
OR Country = 'UK';


-- QUERY 12: WHERE + AND + LIKE
-- USA ke customers jinka naam A se start hota hai

SELECT CustomerID, CompanyName, Country
FROM Customers
WHERE Country = 'USA'
AND CompanyName LIKE 'A%';
