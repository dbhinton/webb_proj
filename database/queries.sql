-- 1. Retrieve order details for "Jack's Plumbing"
-- This query retrieves the order date, customer name, item description, quantity, sales,
-- gross profit, and gross profit percentage for orders placed by "Jack's Plumbing".
SELECT 
    o.ord_date, 
    c.cust_name, 
    i.item_description, 
    od.qty, 
    od.sales, 
    (od.sales - (od.qty * od.unit_cost)) AS gross_profit, 
    ((od.sales - (od.qty * od.unit_cost)) / od.sales * 100) AS gross_profit_percent
FROM 
    orders o
JOIN 
    order_detail od ON o.ord_id = od.ord_id
JOIN 
    customer c ON o.cus_id = c.cus_id
JOIN 
    item_master i ON od.item_id = i.item_id
WHERE 
    c.cust_name = 'Jack''s Plumbing';


-- 2. Calculate total sales and gross profit percentage by item category
-- This query aggregates sales and gross profit for each item category.
SELECT 
    i.item_category, 
    SUM(od.sales) AS total_sales, 
    SUM(od.sales - (od.qty * od.unit_cost)) AS gross_profit, 
    (SUM(od.sales - (od.qty * od.unit_cost)) / SUM(od.sales) * 100) AS gross_profit_percent
FROM 
    order_detail od
JOIN 
    item_master i ON od.item_id = i.item_id
GROUP BY 
    i.item_category;


-- 3. List orders with no corresponding customer
-- This query finds orders that do not have a matching customer in the customer table.
SELECT 
    *
FROM 
    orders o
LEFT JOIN 
    customer c ON o.cus_id = c.cus_id
WHERE 
    c.cus_id IS NULL;


-- 4. Find the largest sales transaction for each customer
-- This query retrieves the largest sales transaction for each customer.
SELECT 
    c.cust_name, 
    i.item_description, 
    MAX(od.sales) AS largest_sale
FROM 
    orders o
JOIN 
    order_detail od ON o.ord_id = od.ord_id
JOIN 
    customer c ON o.cus_id = c.cus_id
JOIN 
    item_master i ON od.item_id = i.item_id
GROUP BY 
    c.cust_name, 
    i.item_description;


-- 5. List the top 3 transactions (sales) for each customer
-- This query retrieves the top 3 sales transactions for every customer.
WITH RankedTransactions AS (
    SELECT 
        c.cust_name, 
        od.sales, 
        ROW_NUMBER() OVER (
            PARTITION BY c.cust_name 
            ORDER BY od.sales DESC
        ) AS rank
    FROM 
        orders o
    JOIN 
        order_detail od ON o.ord_id = od.ord_id
    JOIN 
        customer c ON o.cus_id = c.cus_id
)
SELECT 
    cust_name, 
    sales
FROM 
    RankedTransactions
WHERE 
    rank <= 3;


-- 6. Calculate total sales and minimum standard gross profit percentage
-- This query calculates the total sales and the minimum gross profit percentage for customers in branch 3.
SELECT 
    SUM(d.sales) AS tot_sales, 
    MIN(p.std_gpp) AS min_std_gpp
FROM 
    orders o
INNER JOIN 
    order_detail d ON o.ord_id = d.ord_id
INNER JOIN 
    customer c ON c.cus_id = o.cus_id
INNER JOIN 
    price p ON p.cust_br = c.cust_br
WHERE 
    c.cust_br = 3;
