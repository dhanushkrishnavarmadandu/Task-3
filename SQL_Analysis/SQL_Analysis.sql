use masai;
show tables;
describe customers;
describe orders;
describe products;
describe orderdetails;
describe payments;
describe category;
select * from customers limit 10;
select * from orders limit 10;
select * from products limit 10;
select * from orderdetails limit 10;
select * from payments limit 10;
select * from category limit 10;

Select CustomerID, FirstName, LastName, City
From customers;
Select DISTINCT City
from customers;
SELECT *
FROM customers
WHERE City = 'New York';

SELECT CustomerID, FirstName, LastName, City
FROM customers
ORDER BY FirstName ASC;

SELECT
    COUNT(*) AS Total_Customers
FROM customers;

DESCRIBE orderdetails;
SELECT
    SUM(Quantity) AS Total_Quantity,
    AVG(Quantity) AS Average_Quantity
FROM orderdetails;

SELECT
    City,
    COUNT(*) AS Total_Customers
FROM customers
GROUP BY City
ORDER BY Total_Customers DESC;

SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    o.OrderID
FROM customers AS c
INNER JOIN orders AS o
ON c.CustomerID = o.CustomerID;

SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    o.OrderID
FROM customers AS c
LEFT JOIN orders AS o
ON c.CustomerID = o.CustomerID;

SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    o.OrderID
FROM customers AS c
RIGHT JOIN orders AS o
ON c.CustomerID = o.CustomerID;

DESCRIBE orderdetails;
DESCRIBE products;

SELECT
    o.OrderID,
    od.ProductID
FROM orders AS o
INNER JOIN orderdetails AS od
ON o.OrderID = od.OrderID
INNER JOIN products AS p
ON od.ProductID = p.ProductID;

SELECT
    CustomerID,
    FirstName,
    LastName
FROM customers
WHERE CustomerID IN (
    SELECT CustomerID
    FROM orders
);

CREATE VIEW Customer_Order_Summary AS
SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    COUNT(o.OrderID) AS Total_Orders
FROM customers AS c
LEFT JOIN orders AS o
ON c.CustomerID = o.CustomerID
GROUP BY
    c.CustomerID,
    c.FirstName,
    c.LastName;
    SELECT *
FROM Customer_Order_Summary;

CREATE INDEX idx_orders_customer
ON orders(CustomerID);
SHOW INDEX FROM orders;



