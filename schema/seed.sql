INSERT INTO customers (customer_id, customer_name, signup_date, region) VALUES
(1, 'Aarav Sharma', '2026-01-05', 'North'),
(2, 'Priya Patel', '2026-01-12', 'West'),
(3, 'Rohan Verma', '2026-01-20', 'North'),
(4, 'Sneha Rao', '2026-02-02', 'South'),
(5, 'Vikram Singh', '2026-02-15', 'East');

INSERT INTO orders (order_id, customer_id, order_date, order_amount, order_status) VALUES
(101, 1, '2026-01-10', 1200.00, 'COMPLETED'),
(102, 2, '2026-01-15', 2500.00, 'COMPLETED'),
(103, 3, '2026-01-22', 800.00, 'COMPLETED'),
(104, 1, '2026-02-05', 1500.00, 'COMPLETED'),
(105, 4, '2026-02-10', 3200.00, 'COMPLETED'),
(106, 2, '2026-02-18', 2100.00, 'COMPLETED'),
(107, 1, '2026-03-02', 1800.00, 'COMPLETED'),
(108, 3, '2026-03-12', 950.00, 'COMPLETED'),
(109, 5, '2026-03-20', 4100.00, 'COMPLETED'),
(110, 4, '2026-03-25', 1100.00, 'CANCELLED');