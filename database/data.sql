
INSERT INTO orders (ord_id, ord_date, cus_id)
VALUES
(1234, '2016-02-01', 533),
(1235, '2016-03-02', 655),
(1236, '2016-03-03', 533),
(1237, '2016-04-15', 567);


INSERT INTO order_detail (ord_id, item_id, qty, sales, unit_cost)
VALUES
(1234, 123, 3, 1200.00, 20.15),
(1235, 386, 1, 150.00, 82.36),
(1236, 386, 2, 4000.00, 938.00),
(1237, 586, 1, 15.00, 9.12);

INSERT INTO item_master (item_id, item_description, item_category)
VALUES
(123, '1/2-inch copper 90 degree elbow', 'f'),
(386, '3/4-inch copper tubing 20 feet', 'f'),
(586, 'Water Heater', 'c');

INSERT INTO customer (cus_id, cust_name, cust_type, cust_class, cust_br)
VALUES
(533, 'Jack''s Plumbing', 'Plumbing', 3, 4),
(655, 'Joe''s Mechanical', 'Mechanical Contractor', 1, 3),
(567, 'AirTemp HVAC', 'AC', 3, 1);

INSERT INTO price (cust_br, cust_class, item_category, std_gpp)
VALUES
(4, 3, 'f', 35),
(1, 3, 'c', 45),
(3, 3, 'f', 40);
