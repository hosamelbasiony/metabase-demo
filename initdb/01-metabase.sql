CREATE DATABASE IF NOT EXISTS app_db
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

GRANT ALL PRIVILEGES ON app_db.* TO 'app_user'@'%';
FLUSH PRIVILEGES;

USE app_db;

-- =========================
-- Customers
-- =========================
CREATE TABLE customers (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(150),
  country VARCHAR(50),
  created_at DATETIME
);

INSERT INTO customers (name, email, country, created_at) VALUES
('Ahmed Ali', 'ahmed@example.com', 'Egypt', '2024-01-10 09:00:00'),
('Sara Hassan', 'sara@example.com', 'UAE', '2024-01-12 10:30:00'),
('Mohamed Adel', 'mohamed@example.com', 'Saudi Arabia', '2024-02-01 14:15:00'),
('Lina Omar', 'lina@example.com', 'Jordan', '2024-02-18 11:00:00'),
('Youssef Khaled', 'youssef@example.com', 'Egypt', '2024-03-05 16:45:00'),
('Fatima Noor', 'fatima@example.com', 'UAE', '2024-03-20 08:30:00'),
('Omar Samir', 'omar@example.com', 'Kuwait', '2024-04-01 12:00:00'),
('Hala Zaid', 'hala@example.com', 'Egypt', '2024-04-10 15:20:00'),
('Ziad Karim', 'ziad@example.com', 'Saudi Arabia', '2024-05-02 09:45:00'),
('Maya Tarek', 'maya@example.com', 'Lebanon', '2024-05-15 11:30:00'),
('Samer Fadi', 'samer@example.com', 'Jordan', '2024-06-01 14:00:00'),
('Nour Salim', 'nour@example.com', 'Oman', '2024-06-12 10:15:00'),
('Rami Bassam', 'rami@example.com', 'Egypt', '2024-07-05 13:50:00'),
('Layla Mourad', 'layla@example.com', 'UAE', '2024-07-20 16:10:00'),
('Karim Amin', 'karim@example.com', 'Saudi Arabia', '2024-08-05 08:55:00'),
('Dina Fouad', 'dina@example.com', 'Qatar', '2024-08-18 12:30:00'),
('Tarek Hany', 'tarek@example.com', 'Egypt', '2024-09-02 15:00:00'),
('Salma Wael', 'salma@example.com', 'Morocco', '2024-09-15 09:20:00'),
('Fady Nabil', 'fady@example.com', 'Tunisia', '2024-10-01 11:45:00'),
('Mona Samy', 'mona@example.com', 'Egypt', '2024-10-12 14:30:00');

-- =========================
-- Products
-- =========================
CREATE TABLE products (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  category VARCHAR(50),
  price DECIMAL(10,2)
);

INSERT INTO products (name, category, price) VALUES
('Starter Plan', 'Subscription', 29.00),
('Pro Plan', 'Subscription', 79.00),
('Enterprise Plan', 'Subscription', 199.00),
('AI Add-on', 'Addon', 15.00),
('Cloud Storage', 'Addon', 10.00),
('Premium Support', 'Addon', 49.00);

-- =========================
-- Orders
-- =========================
CREATE TABLE orders (
  id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  status VARCHAR(30),
  total_amount DECIMAL(10,2),
  FOREIGN KEY (customer_id) REFERENCES customers(id)
);

INSERT INTO orders (customer_id, order_date, status, total_amount) VALUES
(1, '2024-01-15', 'paid', 29.00),
(2, '2024-01-20', 'paid', 79.00),
(3, '2024-02-05', 'paid', 94.00),
(4, '2024-02-25', 'failed', 29.00),
(5, '2024-03-10', 'paid', 79.00),
(6, '2024-03-25', 'paid', 214.00),
(7, '2024-04-05', 'paid', 29.00),
(8, '2024-04-15', 'paid', 39.00),
(9, '2024-05-10', 'paid', 79.00),
(10, '2024-05-20', 'paid', 128.00),
(1, '2024-06-05', 'paid', 29.00),
(11, '2024-06-15', 'paid', 199.00),
(12, '2024-07-01', 'failed', 79.00),
(13, '2024-07-10', 'paid', 44.00),
(14, '2024-08-01', 'paid', 79.00),
(15, '2024-08-15', 'paid', 248.00),
(16, '2024-09-01', 'paid', 29.00),
(17, '2024-09-10', 'paid', 139.00),
(18, '2024-10-05', 'paid', 199.00),
(19, '2024-10-20', 'paid', 29.00),
(20, '2024-11-01', 'paid', 79.00);

-- =========================
-- Order Items
-- =========================
CREATE TABLE order_items (
  id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT,
  product_id INT,
  quantity INT,
  price DECIMAL(10,2),
  FOREIGN KEY (order_id) REFERENCES orders(id),
  FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 29.00), (2, 2, 1, 79.00), (3, 2, 1, 79.00), (3, 4, 1, 15.00),
(4, 1, 1, 29.00), (5, 2, 1, 79.00), (6, 3, 1, 199.00), (6, 4, 1, 15.00),
(7, 1, 1, 29.00), (8, 1, 1, 29.00), (8, 5, 1, 10.00), (9, 2, 1, 79.00),
(10, 2, 1, 79.00), (10, 6, 1, 49.00), (11, 1, 1, 29.00), (12, 3, 1, 199.00),
(13, 1, 1, 29.00), (13, 5, 1, 15.00), (14, 2, 1, 79.00), (15, 3, 1, 199.00),
(15, 6, 1, 49.00), (16, 1, 1, 29.00), (17, 2, 1, 79.00), (17, 6, 1, 60.00),
(18, 3, 1, 199.00), (19, 1, 1, 29.00), (20, 2, 1, 79.00);

-- =========================
-- Payments
-- =========================
CREATE TABLE payments (
  id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT,
  payment_method VARCHAR(50),
  paid_at DATETIME,
  amount DECIMAL(10,2),
  FOREIGN KEY (order_id) REFERENCES orders(id)
);

INSERT INTO payments (order_id, payment_method, paid_at, amount) VALUES
(1, 'Credit Card', '2024-01-15 10:30:00', 29.00),
(2, 'Credit Card', '2024-01-20 14:15:00', 79.00),
(3, 'PayPal', '2024-02-05 09:45:00', 94.00),
(5, 'Credit Card', '2024-03-10 16:00:00', 79.00),
(6, 'Bank Transfer', '2024-03-25 11:20:00', 214.00),
(7, 'Credit Card', '2024-04-05 08:50:00', 29.00),
(8, 'Credit Card', '2024-04-15 18:20:00', 39.00),
(9, 'PayPal', '2024-05-10 12:10:00', 79.00),
(10, 'Credit Card', '2024-05-20 10:00:00', 128.00),
(11, 'Credit Card', '2024-06-05 09:30:00', 29.00),
(12, 'Bank Transfer', '2024-06-15 14:45:00', 199.00),
(14, 'Credit Card', '2024-07-10 16:30:00', 44.00),
(15, 'PayPal', '2024-08-01 11:00:00', 79.00),
(16, 'Credit Card', '2024-08-15 13:20:00', 248.00),
(17, 'Credit Card', '2024-09-01 08:50:00', 29.00),
(18, 'Bank Transfer', '2024-09-10 15:10:00', 139.00),
(19, 'PayPal', '2024-10-05 10:30:00', 199.00),
(20, 'Credit Card', '2024-10-20 12:45:00', 29.00),
(21, 'Credit Card', '2024-11-01 09:15:00', 79.00);

-- =========================
-- Subscriptions
-- =========================
CREATE TABLE subscriptions (
  id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT,
  plan VARCHAR(50),
  start_date DATE,
  end_date DATE,
  status VARCHAR(30),
  monthly_revenue DECIMAL(10,2),
  FOREIGN KEY (customer_id) REFERENCES customers(id)
);

INSERT INTO subscriptions (customer_id, plan, start_date, end_date, status, monthly_revenue) VALUES
(1, 'Starter', '2024-01-15', NULL, 'active', 29.00),
(2, 'Pro', '2024-01-20', NULL, 'active', 79.00),
(3, 'Pro', '2024-02-05', NULL, 'active', 79.00),
(4, 'Starter', '2024-02-25', '2024-03-01', 'canceled', 29.00),
(5, 'Pro', '2024-03-10', NULL, 'active', 79.00),
(6, 'Enterprise', '2024-03-25', NULL, 'active', 199.00),
(7, 'Starter', '2024-04-05', NULL, 'active', 29.00),
(8, 'Starter', '2024-04-15', '2024-08-01', 'canceled', 29.00),
(9, 'Pro', '2024-05-10', NULL, 'active', 79.00),
(10, 'Pro', '2024-05-20', NULL, 'active', 79.00),
(11, 'Enterprise', '2024-06-15', NULL, 'active', 199.00),
(12, 'Pro', '2024-07-01', '2024-07-15', 'canceled', 79.00),
(13, 'Starter', '2024-07-10', NULL, 'active', 29.00),
(14, 'Pro', '2024-08-01', NULL, 'active', 79.00),
(15, 'Enterprise', '2024-08-15', NULL, 'active', 199.00),
(16, 'Starter', '2024-09-01', NULL, 'active', 29.00),
(17, 'Pro', '2024-09-10', NULL, 'active', 79.00),
(18, 'Enterprise', '2024-10-05', NULL, 'active', 199.00),
(19, 'Starter', '2024-10-20', NULL, 'active', 29.00),
(20, 'Pro', '2024-11-01', NULL, 'active', 79.00);

