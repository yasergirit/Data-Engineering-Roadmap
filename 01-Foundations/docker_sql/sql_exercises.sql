-- Module 2: SQL Exercises for Data Engineering

-- 1. JOINS: Get product names along with their category names
-- Goal: Understand how to link normalized tables.
SELECT 
    p.name AS product_name, 
    c.name AS category_name, 
    p.price
FROM products p
JOIN categories c ON p.category_id = c.category_id;


-- 2. AGGREGATIONS: Calculate total revenue per category
-- Goal: Practice Group By and Sum.
SELECT 
    c.name AS category_name, 
    SUM(s.total_amount) AS total_revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.name
ORDER BY total_revenue DESC;


-- 3. WINDOW FUNCTIONS: Rank products by price within their categories
-- Goal: Advanced SQL skill often used in data transformation.
SELECT 
    name, 
    category_id, 
    price,
    RANK() OVER (PARTITION BY category_id ORDER BY price DESC) as price_rank
FROM products;


-- 4. CASE STATEMENTS: Performance categorization
-- Goal: Labeling data based on conditions.
SELECT 
    name, 
    price,
    CASE 
        WHEN price > 500 THEN 'Premium'
        WHEN price BETWEEN 100 AND 500 THEN 'Mid-range'
        ELSE 'Budget'
    END as price_category
FROM products;
