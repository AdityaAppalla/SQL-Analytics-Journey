USE Analysis;

/* 1. Basic Customer Order Summary */
SELECT CONCAT(a.f_name,' ',a.l_name) AS full_name, b.order_id, b.total_amount
FROM customers AS a 
JOIN orders as b ON a.customer_id = b.customer_id;

/* 2. Top 2 Spenders by Lifetime Value */
SELECT CONCAT(a.f_name,' ',a.l_name) AS full_name, SUM(b.total_amount) as Total_Amt
FROM customers AS a 
JOIN orders as b ON a.customer_id = b.customer_id
GROUP BY a.customer_id, a.f_name, a.l_name
ORDER BY Total_Amt DESC
LIMIT 2;

/* 3. Revenue Generated per Product Line */
SELECT a.product_id, a.product_name, SUM(a.price * b.quantity) AS Revenue_Generated
FROM products as a 
JOIN order_items as b ON a.product_id = b.product_id
GROUP BY a.product_id, a.product_name
ORDER BY Revenue_Generated DESC;

/* 4. High-Value Customer Identification */
SELECT CONCAT(a.f_name,' ',a.l_name) AS full_name, SUM(b.total_amount) as Total_amt
FROM customers AS a 
JOIN orders as b ON a.customer_id = b.customer_id
GROUP BY a.customer_id, a.f_name, a.l_name
HAVING Total_amt > 1000
ORDER BY Total_amt DESC;

/* 5. Identifying Inactive Customers  */
SELECT a.customer_id, CONCAT(a.f_name,' ',a.l_name) AS full_name
FROM customers as a 
LEFT JOIN orders as b ON a.customer_id = b.customer_id
WHERE b.order_id IS NULL;

/* 6. Identifying Non-Performing Products  */
SELECT a.product_id, a.product_name
FROM products a 
LEFT JOIN order_items b ON a.product_id = b.product_id
WHERE b.product_id IS NULL;

/* 7. Top 2 Purchased Products per Customer */
-- Using Window Functions to rank product preferences
SELECT * FROM (
    SELECT 
        CONCAT(a.f_name, ' ', a.l_name) AS full_name, 
        d.product_name,
        SUM(c.quantity) AS total_qty,
        ROW_NUMBER() OVER (PARTITION BY a.customer_id ORDER BY SUM(c.quantity) DESC) AS rn
    FROM customers a 
    JOIN orders b ON a.customer_id = b.customer_id
    JOIN order_items c ON b.order_id = c.order_id
    JOIN products d ON c.product_id = d.product_id
    GROUP BY a.customer_id, d.product_id, d.product_name, a.f_name, a.l_name
) t
WHERE rn <= 2;
