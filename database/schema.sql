-- Drop existing tables if they exist to reset the database structure
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS order_detail;
DROP TABLE IF EXISTS item_master;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS price;

-- Create the orders table
-- Stores basic information about orders, such as order ID, date, and customer ID
CREATE TABLE orders (
    ord_id INTEGER PRIMARY KEY AUTOINCREMENT,
    ord_date TEXT,
    cus_id INTEGER
);

-- Create the order_detail table
-- Stores detailed information about items in each order, including quantities, sales, and costs
CREATE TABLE order_detail (
    ord_id INTEGER,
    item_id INTEGER,
    qty INTEGER,
    sales REAL,
    unit_cost REAL,
    FOREIGN KEY (ord_id) REFERENCES orders (ord_id)
);

-- Create the item_master table
-- Defines items available for orders with their descriptions and categories
CREATE TABLE item_master (
    item_id INTEGER PRIMARY KEY AUTOINCREMENT,
    item_description TEXT,
    item_category TEXT
);

-- Create the customer table
-- Stores customer details, including ID, name, type, classification, and branch information
CREATE TABLE customer (
    cus_id INTEGER PRIMARY KEY AUTOINCREMENT,
    cust_name TEXT,
    cust_type TEXT,
    cust_class INTEGER,
    cust_br INTEGER
);

-- Create the price table
-- Stores pricing data, including standard gross profit percentages, categorized by branch, class, and item type
CREATE TABLE price (
    cust_br INTEGER,
    cust_class INTEGER,
    item_category TEXT,
    std_gpp REAL,
    PRIMARY KEY (cust_br, cust_class, item_category)
);
