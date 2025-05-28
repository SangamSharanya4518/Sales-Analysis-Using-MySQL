CREATE DATABASE COMPANY;
use company;
select * from sales;

-- Q1:Find all orders shipped via ‘economy’ mode with a total amount greater than ₹25,000.--


SELECT * FROM SALES
WHERE SHIP_MODE = 'Economy' AND Total_Amount > 25000;

-- Q2: Retrieve all sales data for ‘Technology’ category in ‘Ireland’ made after 2020-01-01.--

SELECT * FROM SALES
WHERE Category = 'Technology'and Country = 'Ireland' AND Order_Date > '2020-01-01';

-- Q3: List the top 10 most profitable sales transactions in descending order.--

SELECT * FROM SALES
ORDER BY Unit_Profit desc
limit 10;                             # top 10 transactions

SELECT * FROM SALES
ORDER BY Unit_Profit desc
limit 10, 20;                           # skip 10 records, showing next 20 records

-- 	Q4: Find all customers whose name starts with ‘J’ and ends with ‘n’.--

SELECT ORDER_ID, CUSTOMER_NAME FROM sales
WHERE CUSTOMER_NAME LIKE 'J%N' ;

-- Q5: Retrieve all product names that contain ‘Acco’ anywhere in the name.--

SELECT ORDER_ID, PRODUCT_NAME FROM SALES
WHERE PRODUCT_NAME LIKE '%ACCO%';

-- Q5: Get the top 5 cities with the highest total sales amount.--

SELECT CITY, SUM(TOTAL_AMOUNT) AS TOTAL_SALES FROM SALES
GROUP BY CITY
ORDER BY TOTAL_SALES DESC
LIMIT 5;


-- Q6: Display the second set of 10 records for customer_name and total _amount in decreasing order.--

SELECT CUSTOMER_NAME, TOTAL_AMOUNT FROM SALES
ORDER BY TOTAL_AMOUNT DESC 
LIMIT 10, 10;

-- Q7: Find the total revenue, average unit cost, and total number of orders.--

SELECT SUM(TOTAL_AMOUNT) AS `TOTAL REVENUE`,
AVG(UNIT_COST) AS `AVERAGE UNIT COST`,
COUNT(ORDER_ID) AS `TOTAL NUMBER OF ORDERS` FROM SALES;

-- Q8: Count unique number of regions.--

SELECT COUNT(DISTINCT(REGION)) AS UNIQ_REG
FROM SALES;

--  Q9: Find the number of orders placed by each customer.--

SELECT CUSTOMER_NAME, COUNT(ORDER_ID) AS ORDER_COUNT
FROM SALES
GROUP BY CUSTOMER_NAME
ORDER BY ORDER_COUNT DESC;

-- Q10: Rank 5 products based on total sales using RANK().--

SELECT PRODUCT_NAME, SUM(TOTAL_AMOUNT) AS TOTAL_SALES,
RANK() OVER (ORDER BY SUM(TOTAL_AMOUNT) DESC) AS SALES_RANK
FROM SALES
GROUP BY PRODUCT_NAME
LIMIT 5;



 