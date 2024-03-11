create database Customers_Orders_Products 

use Customers_Orders_Products

CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY,
  Name VARCHAR(50),
  Email VARCHAR(100)
);

INSERT INTO Customers (CustomerID, Name, Email)
VALUES
  (1, 'John Doe', 'johndoe@example.com'),
  (2, 'Jane Smith', 'janesmith@example.com'),
  (3, 'Robert Johnson', 'robertjohnson@example.com'),
  (4, 'Emily Brown', 'emilybrown@example.com'),
  (5, 'Michael Davis', 'michaeldavis@example.com'),
  (6, 'Sarah Wilson', 'sarahwilson@example.com'),
  (7, 'David Thompson', 'davidthompson@example.com'),
  (8, 'Jessica Lee', 'jessicalee@example.com'),
  (9, 'William Turner', 'williamturner@example.com'),
  (10, 'Olivia Martinez', 'oliviamartinez@example.com');



  CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerID INT,
  ProductName VARCHAR(50),
  OrderDate DATE,
  Quantity INT
);

INSERT INTO Orders (OrderID, CustomerID, ProductName, OrderDate, Quantity)
VALUES
  (1, 1, 'Product A', '2023-07-01', 5),
  (2, 2, 'Product B', '2023-07-02', 3),
  (3, 3, 'Product C', '2023-07-03', 2),
  (4, 4, 'Product A', '2023-07-04', 1),
  (5, 5, 'Product B', '2023-07-05', 4),
  (6, 6, 'Product C', '2023-07-06', 2),
  (7, 7, 'Product A', '2023-07-07', 3),
  (8, 8, 'Product B', '2023-07-08', 2),
  (9, 9, 'Product C', '2023-07-09', 5),
  (10, 10, 'Product A', '2023-07-10', 1);



  CREATE TABLE Products (
  ProductID INT PRIMARY KEY,
  ProductName VARCHAR(50),
  Price DECIMAL(10, 2)
);

INSERT INTO Products (ProductID, ProductName, Price)
VALUES
  (1, 'Product A', 10.99),
  (2, 'Product B', 8.99),
  (3, 'Product C', 5.99),
  (4, 'Product D', 12.99),
  (5, 'Product E', 7.99),
  (6, 'Product F', 6.99),
  (7, 'Product G', 9.99),
  (8, 'Product H', 11.99),
  (9, 'Product I', 14.99),
  (10, 'Product J', 4.99);

  SELECT * FROM Customers
  SELECT * FROM Orders
  SELECT * FROM Products


  ---TASK 1-----

 -- Q1
 select * from Customers

 --Q2

 SELECT NAME, EMAIL FROM Customers WHERE lower(NAME) LIKE 'j%'

 --Q3
 SELECT OrderID, ProductName, Quantity FROM Orders

 --Q4
 SELECT SUM(QUANTITY) AS TOTAL_QUANTITY FROM Orders

 --Q5
 SELECT C.NAME  FROM CUSTOMERS C JOIN ORDERS O ON C.CustomerID=O.CustomerID

 --Q6
 SELECT * FROM Products WHERE PRICE >10.00

 --Q7
  SELECT C.NAME, O.OrderDate  FROM CUSTOMERS C JOIN ORDERS O ON C.CustomerID=O.CustomerID WHERE O.OrderDate >='2023-07-05'

  --Q8
  SELECT AVG(PRICE) AS AVERAGE_PRICE FROM Products

  --Q9
    SELECT * FROM Customers
  SELECT * FROM Orders
  SELECT * FROM Products
   SELECT C.NAME,  sum(o.quantity) as total  
   FROM CUSTOMERS C JOIN ORDERS O ON C.CustomerID=O.CustomerID group by c.name


   --Q10
   select productname from products where productname not in (select productname from Orders)

   select p.productname from orders o right join products p on o.ProductName = p.productname where OrderDate is null



   --TASK 2

   --Q1
 SELECT TOP 5 * FROM ORDERS  ORDER BY QUANTITY DESC

 --Q2
 SELECT PRODUCTNAME, AVG(PRICE) AS Avg_Price FROM Products GROUP BY ProductName

 --Q3
 select c.customerid, c.name from customers c where c.customerid not in (select o.customerid from orders o)

 --Q4
 SELECT O.OrderID, O.ProductName, O.Quantity FROM CUSTOMERS C  
 JOIN ORDERS O ON C.CustomerID=O.CustomerID WHERE LOWER(C.NAME) LIKE 'm%'

 --Q5
 select sum(o.quantity * p.price) as Total_Revenue from orders o, products p where o.productname = p.productname


 --Q6
  select (select name from customers c where c.customerid = o.customerid) as customer_name, o.quantity * p.price as Total_Revenue from orders o, products p where o.productname = p.productname



 --Q7 
 SELECT C.CUSTOMERID FROM
(SELECT O.CUSTOMERID, COUNT(O.productname) AS COUNT_of_pr FROM 
(SELECT DISTINCT CUSTOMERID, PRODUCTNAME FROM ORDERS) O GROUP BY O.CustomerID) C WHERE COUNT_of_pr =
(SELECT COUNT(PRODUCTNAME) FROM Products)

 --Q8 -- couldnt understand with the given data
  

  --Q9

  SELECT top 3 productname, AVG(QUANTITY) as avg_quantity FROM Orders group by productname order by avg_quantity desc

  --Q10

select  100 * (SELECT count(*) FROM orders where quantity > ( SELECT AVG(QUANTITY) FROM Orders))/
(select count(*) from orders )


--Task 3

-- INSERTED BELOW DATA IN ORDERS TABLE TO GATHER SAMPLE DATA FOR QUERY RESULTS FOR TASK 3 QUESTIONS


INSERT INTO Orders (OrderID, CustomerID, ProductName, OrderDate, Quantity)
VALUES
  (11, 1, 'Product B', '2023-07-02', 4),
  (12, 1, 'Product C', '2023-07-03', 3),
  (13, 1, 'Product D', '2023-08-03', 2),
  (14, 1, 'Product E', '2023-09-04', 1),
  (15, 1, 'Product F', '2023-10-05', 4),
  (16, 1, 'Product G', '2023-10-06', 2),
  (17, 1, 'Product H', '2023-11-07', 3),
  (18, 1, 'Product I', '2023-01-08', 2),
  (19, 1, 'Product J', '2023-12-09', 5),
  (20, 2, 'Product A', '2023-02-10', 1),
  (21, 3, 'Product A', '2023-03-10', 1),
  (22, 5, 'Product A', '2023-02-11', 1),
  (23, 6, 'Product A', '2023-02-12', 1),
  (24, 8, 'Product A', '2023-05-10', 1),
  (25, 9, 'Product A', '2023-05-10', 1),
(26, 1, 'Product B', '2023-02-02', 4),
(27, 1, 'Product B', '2023-03-03', 4),
(28, 1, 'Product B', '2023-04-02', 4),
(29, 1, 'Product B', '2023-05-02', 4),
(30, 1, 'Product B', '2023-06-02', 4),
(31, 1, 'Product B', '2023-07-02', 4); 
    SELECT * FROM Customers
  SELECT * FROM Orders
  SELECT * FROM Products

--1

SELECT C.CUSTOMERID FROM
(SELECT O.CUSTOMERID, COUNT(O.productname) AS COUNT_of_pr FROM 
(SELECT DISTINCT CUSTOMERID, PRODUCTNAME FROM ORDERS) O GROUP BY O.CustomerID) C WHERE COUNT_of_pr =
(SELECT COUNT(PRODUCTNAME) FROM Products)

--2
select p.productname from 
(SELECT O.PRODUCTNAME, COUNT(O.PRODUCTNAME) AS Cust_count FROM 
(SELECT DISTINCT CUSTOMERID, PRODUCTNAME FROM ORDERS) O GROUP BY PRODUCTNAME) p where Cust_count =
(select count(customerid) from Customers)



--3
select month(o.orderdate) as month, sum(o.quantity * p.price) as revenue
from orders o, products p where o.productname=p.productname group by month(o.OrderDate)

--4

select productname from (select productname, count(productname) as cnt from
(SELECT distinct CUSTOMERID, PRODUCTNAME FROM ORDERS) o group by productname) p where cnt >
(select count(customerid)/2 from customers)


--5
select top 5 o.CustomerID, sum(o.quantity * p.price) as money 
from orders o, products p where o.productname=p.productname group by o.CustomerID order by money desc

--6
select o.orderid, o.CustomerID, o.quantity*p.price as rev, 
(select sum(o1.quantity*p1.price) from orders o1, products p1 where o1.ProductName = p1.productname and o1.orderid<=o.orderid) as runningtotal
from orders o, products p where o.ProductName = p.productname order by o.customerid, o.orderid asc


--7

SELECT a.CUSTOMERID, a.ORDERDATE FROM (
SELECT CUSTOMERID, ORDERDATE, ROW_NUMBER() OVER (
      PARTITION BY CUSTOMERID
      ORDER BY ORDERDATE DESC ) as row_num  FROM ORDERS ) a where row_num <=3

--8
select o.customerid, sum(o.quantity* p.price) as revenue, OrderID, o.orderdate from orders o, products p where o.ProductName = p.ProductName and 
DATEADD(day, -30, getdate()) <= o.orderdate and o.orderdate <= getdate()
group by o.CustomerID, o.orderid, o.orderdate







    SELECT * FROM Customers
  SELECT * FROM Orders
  SELECT * FROM Products


--9
select c.customerid, count(c.productname) as Count_of_Products from 
(select distinct o.customerid, o.productname from orders o ) c group by c.customerid having count(c.productname) >=2

--10)

select o.customerid, avg(o.quantity*p.price) as avg_revenue from orders o , products p where o.ProductName=p.ProductName group by o.CustomerID

--11)

select c.customerid, count(c.order_month) from 
(select distinct o.customerid, month(o.OrderDate) order_month from orders o) c group by c.customerid having count(c.order_month) = 12 



--13)
select c.customerid, c.productname, count(c.productname) as no_of_products  from
(select o.customerid, o.productname from orders o)c group by c.customerid, c.productname having count(c.productname) >=2




