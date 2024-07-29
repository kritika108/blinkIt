# Questions to Address with SQL Queries

# What are the total sales and how are they distributed across different outlet types?
SELECT outlet_type, SUM(sales_amount) AS total_sales
FROM sales
JOIN outlets ON sales.outlet_id = outlets.outlet_id
GROUP BY outlet_type;
# What is the average sales value per transaction?
SELECT AVG(sales_amount) AS avg_sales
FROM sales;
# How many items have been sold in total, and which item types contribute the most to sales?
SELECT COUNT(item_id) AS no_of_items
FROM sales;
SELECT item_type, SUM(sales_amount) AS total_sales
FROM sales
JOIN items ON sales.item_id = items.item_id
GROUP BY item_type
ORDER BY total_sales DESC;
# What is the average customer rating for the outlets?
SELECT AVG(rating) AS avg_rating
FROM customer_reviews;
# How do sales trends vary over time, and what impact does the year of establishment have on sales?
SELECT YEAR(establishment_date) AS year, SUM(sales_amount) AS total_sales
FROM sales
JOIN outlets ON sales.outlet_id = outlets.outlet_id
GROUP BY YEAR(establishment_date)
ORDER BY year;
# How does outlet size influence sales performance?
SELECT outlet_size, SUM(sales_amount) AS total_sales
FROM sales
JOIN outlets ON sales.outlet_id = outlets.outlet_id
GROUP BY outlet_size;
# What is the sales distribution across different outlet locations (Tier 1, Tier 2, Tier 3)?
SELECT location_type, SUM(sales_amount) AS total_sales
FROM sales
JOIN outlets ON sales.outlet_id = outlets.outlet_id
GROUP BY location_type;
# How does the fat content of products affect sales?
SELECT fat_content, SUM(sales_amount) AS total_sales
FROM sales
JOIN items ON sales.item_id = items.item_id
GROUP BY fat_content;
# Which item types generate the highest sales revenue?
SELECT item_type, SUM(sales_amount) AS total_sales
FROM sales
JOIN items ON sales.item_id = items.item_id
GROUP BY item_type
ORDER BY total_sales DESC;
# How does the visibility of items correlate with sales and customer ratings?
SELECT item_type, 
       AVG(items.visibility) AS avg_visibility,
       SUM(sales_amount) AS total_sales,
       AVG(customer_reviews.rating) AS avg_rating
FROM sales
JOIN items ON sales.item_id = items.item_id
JOIN customer_reviews ON sales.customer_id = customer_reviews.customer_id
GROUP BY item_type;
