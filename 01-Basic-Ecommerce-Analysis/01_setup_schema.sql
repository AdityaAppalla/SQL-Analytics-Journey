CREATE DATABASE Analysis;
USE Analysis;

-- Creating table

CREATE TABLE customers(
    customer_id INT NOT NULL PRIMARY KEY,
    f_name VARCHAR(40),
    l_name VARCHAR (40),
    city VARCHAR(25),
    ph_num VARCHAR(10) -- Initial just for IN: local 10-digit numbers
);

CREATE TABLE products(
    product_id INT PRIMARY KEY,
    product_name VARCHAR(30),
    price DECIMAL(10, 2)
);

CREATE TABLE orders(
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items(
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Requirement Update: Support international phone formats for global customers.
ALTER TABLE customers
MODIFY COLUMN ph_num VARCHAR(20);
