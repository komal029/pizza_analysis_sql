SELECT * FROM pizza_sales
SELECT SUM(total_price)AS Total_revenue from pizza_sales
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS avg_order_values from pizza_sales
SELECT SUM(quantity)AS total_order_sold from pizza_sales
SELECT COUNT(DISTINCT order_id) AS total_order from pizza_sales

SELECT DATENAME(DW, order_date) as order_per_day, COUNT(DISTINCT order_id) AS Total_order
from pizza_sales
GROUP BY DATENAME(DW, order_date)

SELECT DATENAME(MONTH, order_date) as order_per_month, COUNT(DISTINCT order_id) AS Total_order_per_month
from pizza_sales
GROUP BY DATENAME(MONTH, order_date)
ORDER BY Total_order_per_month DESC

SELECT pizza_category, SUM(total_price) as total_sales, SUM(total_price) * 100/ (SELECT SUM(total_price) from pizza_sales) AS perc_total_sales
from pizza_sales 
GROUP BY pizza_category

SELECT 
    pizza_category,
    SUM(total_price) as total_sales,
    (SUM(total_price) * 100.0 / CAST((SELECT SUM(total_price) FROM pizza_sales WHERE MONTH(order_date) = 1) AS decimal)) AS perc_total_sales
FROM 
    pizza_sales 
WHERE 
    MONTH(order_date) = 1
GROUP BY 
    pizza_category;

SELECT pizza_size, SUM(total_price) as total_sales, CAST(SUM(total_price) * 100/ 
(SELECT SUM(total_price) from pizza_sales) AS DECIMAL (10,2))AS perc_total_sales
from pizza_sales 
GROUP BY pizza_size
order by perc_total_sales desc


SELECT TOP 5 pizza_name, SUM(total_price) As total_rev FROM pizza_sales
GROUP BY pizza_name 
ORDER BY total_rev desc

SELECT TOP 5 pizza_name, SUM(total_price) As total_rev FROM pizza_sales
GROUP BY pizza_name 
ORDER BY total_rev asc

SELECT TOP 5 pizza_name, SUM(quantity) As total_quant FROM pizza_sales
GROUP BY pizza_name 
ORDER BY total_quant desc

SELECT TOP 5 pizza_name, SUM(quantity) As total_quant FROM pizza_sales
GROUP BY pizza_name 
ORDER BY total_quant asc

SELECT TOP 5 pizza_name, SUM(quantity) As total_quant FROM pizza_sales
GROUP BY pizza_name 
ORDER BY total_quant asc

SELECT TOP 5 pizza_name, SUM(quantity) As total_quant FROM pizza_sales
GROUP BY pizza_name 
ORDER BY total_quant desc