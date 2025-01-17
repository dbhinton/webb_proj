DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS order_detail;
DROP TABLE IF EXISTS item_master;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS price;

-- schema.sql
CREATE TABLE orders (
    ord_id INTEGER PRIMARY KEY AUTOINCREMENT,
    ord_date TEXT,
    cus_id INTEGER
);

CREATE TABLE order_detail (
    ord_id INTEGER,
    item_id INTEGER,
    qty INTEGER,
    sales REAL,
    unit_cost REAL,
    FOREIGN KEY (ord_id) REFERENCES orders (ord_id)
);

CREATE TABLE item_master (
    item_id INTEGER PRIMARY KEY AUTOINCREMENT,
    item_description TEXT,
    item_category TEXT
);

CREATE TABLE customer (
    cus_id INTEGER PRIMARY KEY AUTOINCREMENT,
    cust_name TEXT,
    cust_type TEXT,
    cust_class INTEGER,
    cust_br INTEGER
);

CREATE TABLE price (
    cust_br INTEGER,
    cust_class INTEGER,
    item_category TEXT,
    std_gpp REAL,
    PRIMARY KEY (cust_br, cust_class, item_category)
);
