--Explore the Data
select *
from sales_data_sample
-- total number of invoices
select count (DISTINCT ordernumber)
FROM sales_data_sample
--307
select ordernumber, count (orderlinenumber)
FROM sales_data_sample
GROUP by ordernumber


--total number of product categories
SELECT count( DISTINCT productline )
from sales_data_sample
--7
--( Mototcycle,classic cars ,Trucks and buses,vintage cars , planes,ships , trains)


-- total number of quantityordered per order
SELECT ordernumber, COUNT( quantityordered)
from sales_data_sample
group by ordernumber

--total number of unique customers
SELECT count ( DISTINCT customername) as unique_customers
from sales_data_sample
--92


--total amount sales
SELECT sum (sales)as total_sales
from sales_data_sample
-- 10032628,85

--Average order value
SELECT AVG(OrderValue) AS AverageOrderValue
FROM (
    SELECT ordernumber, SUM(sales) AS OrderValue
    FROM sales_data_sample
    GROUP BY ordernumber
) AS OrderValues
-- 32679,57


--identify the most frequently purchased items
SELECT productline,COUNT  (DISTINCT ordernumber) as purchased_count
FROM sales_data_sample
GROUP by productline
order by 2 DESC 
-- Classic Cars

--Number of orders per customers
SELECT customername, COUNT ( DISTINCT ordernumber)as number_orders
from sales_data_sample
GROUP by 1
ORDER by number_orders DESC
limit 10

--explore total sales by country
SELECT country , sum(sales) as total_sales
from sales_data_sample
GROUP by country
order by 2 DESC
limit 10

--total sales by products
SELECT productline,sum (sales)as sales_sales
FROM sales_data_sample
group by 1
order by 2 DESC


-- total sales by year
SELECT year_id, SUM(sales)AS yearlySales
FROM  sales_data_sample
GROUP by 1
order by 2 DESC


-- total sales by month
SELECT month_id, SUM(sales)AS MonthlySales
FROM  sales_data_sample
GROUP by 1
order by 2 DESC


--explore status of orders
SELECT  status , count(DISTINCT ordernumber) as num_orders
from sales_data_sample
GROUP by 1
order by 2 DESC



--explore  column Dealsize 
SELECT dealsize
,SUM(sales) AS total_sales
FROM sales_data_sample
GROUP BY dealsize
ORDER by 2 DESC



-- total sales per city 
SELECT city , sum (sales)as total_sales
FROM sales_data_sample
GROUP by 1
order by 2 DESC 
limit 10

--Number of customers per city
select city ,count( DISTINCT customername)AS num_customers
FROM sales_data_sample
group by 1
order by 2 DESC
limit 20


--Number of customers per country
SELECT country,COUNT (DISTINCT customername)
FROM sales_data_sample
group by 1
order by 2 DESC
limit 5






