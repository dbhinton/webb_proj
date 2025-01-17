-- Test 1: Check if all tables exist
SELECT name AS table_name
FROM sqlite_master
WHERE type = 'table';

-- Test 2: Count rows in each table to ensure data was inserted correctly
SELECT 'orders' AS table_name, COUNT(*) AS row_count FROM orders
UNION ALL
SELECT 'order_detail', COUNT(*) FROM order_detail
UNION ALL
SELECT 'item_master', COUNT(*) FROM item_master
UNION ALL
SELECT 'customer', COUNT(*) FROM customer
UNION ALL
SELECT 'price', COUNT(*) FROM price;