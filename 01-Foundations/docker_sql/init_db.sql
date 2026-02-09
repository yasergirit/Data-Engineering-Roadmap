-- Module 2: SQL Fundamentals - Initialization Script

-- 1. Create Tables
CREATE TABLE IF NOT EXISTS categories (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS products (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category_id INT REFERENCES categories(category_id),
    price DECIMAL(10, 2),
    stock_quantity INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS sales (
    sale_id SERIAL PRIMARY KEY,
    product_id INT REFERENCES products(product_id),
    sale_date DATE DEFAULT CURRENT_DATE,
    quantity INT,
    total_amount DECIMAL(12, 2)
);

-- 2. Insert Sample Data
INSERT INTO categories (name) VALUES ('Electronics'), ('Books'), ('Home & Garden');

INSERT INTO products (name, category_id, price, stock_quantity) VALUES
('Laptop', 1, 1200.00, 10),
('Smartphone', 1, 800.00, 25),
('Data Engineering Book', 2, 45.00, 50),
('Coffee Maker', 3, 60.00, 15);

INSERT INTO sales (product_id, quantity, total_amount) VALUES
(1, 1, 1200.00),
(2, 2, 1600.00),
(3, 5, 225.00);
