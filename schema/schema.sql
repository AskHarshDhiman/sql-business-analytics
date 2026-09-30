-- Core E-Commerce Database Schema
-- Defines relational entities: Customers, Orders, and Order Items

-- Enforce primary customer dimensions
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    signup_date DATE NOT NULL,
    region VARCHAR(50) NOT NULL
);

-- Transactional order headers linked to customers
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    order_date DATE NOT NULL,
    order_amount NUMERIC(10, 2) NOT NULL,
    order_status VARCHAR(20) NOT NULL
);