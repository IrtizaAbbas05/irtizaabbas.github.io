--Display: Order ID, Customer Name, Order Date. Sort by Order Date.

SELECT 
	o.order_id,
	c.customer_name,
	o.order_date
FROM
Customers c
JOIN
Orders o
ON c.customer_id = o.customer_id
ORDER BY o.order_date ASC;

/*
Display:

Order ID,
Product Name,
Quantity 
*/

SELECT
	od.order_id,
	p.product_name,
	od.quantity
FROM
Products p
JOIN
Order_Details od
ON p.product_id = od.product_id;

/*Display:

Order ID
Customer Name
Product Name
Quantity
Discount */

SELECT 
	o.order_id,
	c.customer_name,
	p.product_name,
	od.quantity,
	od.discount
FROM
Orders o
INNER JOIN 
Customers c
ON 
	o.customer_id = c.customer_id
INNER JOIN
Order_Details od
ON
	o.order_id = od.order_id
INNER JOIN
Products p
ON
	p.product_id = od.product_id;

/* Display:

Customer Name
Product Name
Category
Quantity */

SELECT
	c.customer_name,
	p.product_name,
	p.category,
	od.quantity
FROM 
Customers c
JOIN
Orders o
ON c.customer_id = o.customer_id
JOIN
Order_Details od
ON o.order_id = od.order_id
JOIN
Products p
ON od.product_id = p.product_id
WHERE p.category = 'Electronics';

/*Display:

Product Name,
Total Quantity Sold

Sort from highest to lowest.
*/

SELECT
	p.product_name,
	SUM(od.quantity) AS total_quantity
FROM 
Products p
JOIN
Order_Details od
ON p.product_id = od.product_id
GROUP BY p.product_name
ORDER BY total_quantity DESC;

/* Display:

Customer Name
Number of Orders
*/

SELECT 
	c.customer_name,
	COUNT(o.order_id) AS no_of_orders
FROM
Customers c
JOIN
orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

/*Task 7 — Customers Who Never Ordered

Your manager asks:

"Which customers have never placed an order?"

This is your first LEFT JOIN challenge.

Display:

Customer Name
*/

SELECT
	c.customer_id,
	c.customer_name
FROM 
Customers c
LEFT JOIN
Orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

/*Task 8 — Revenue Per Product

Formula:

Revenue = Price × Quantity

Ignore discounts for now.

Display:

Product Name
Revenue

Sort highest first.
*/

SELECT
	p.product_name,
	SUM(p.price * od.quantity) AS Total_Revenue
FROM
Products p
INNER JOIN
Order_Details od
ON p.product_id = od.product_id
GROUP BY p.product_name
ORDER BY Total_Revenue DESC;

/* Display:

Customer Name
Total Revenue
*/

SELECT 
	c.customer_name,
	SUM(od.quantity * p.price) AS total_revenue
FROM
Customers c
INNER JOIN
Orders o
ON c.customer_id = o.customer_id
INNER JOIN
Order_Details od
ON o.order_id = od.order_id
INNER JOIN
Products p
ON od.product_id = p.product_id
GROUP BY c.customer_name;

/*Task 10 — Top Spending Customer

Find the customer who spent the most.

Display:

Customer Name
Total Revenue

Return only the top customer.
*/

SELECT TOP 1 
	c.customer_name,
	SUM(od.quantity * p.price) AS total_revenue
FROM
Customers c
INNER JOIN
Orders o
ON c.customer_id = o.customer_id
INNER JOIN
Order_Details od
ON o.order_id = od.order_id
INNER JOIN
Products p
ON od.product_id = p.product_id
GROUP BY c.customer_name
ORDER BY total_revenue DESC;

/*
Bonus Challenge 
Calculate the actual revenue after discounts.
Formula:

Revenue = (Price - Discount) × Quantity
*/

SELECT 
	p.product_name,
	(p.price - od.discount) * od.quantity AS Revenue
FROM 
Products p
JOIN
Order_Details od
ON p.product_id = od.product_id;



