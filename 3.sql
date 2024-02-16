-- 3. Labeling price ranges
SELECT brands.brand,
       COUNT(finance.product_id) AS count,
       SUM(finance.revenue) AS total_revenue,
       CASE WHEN finance.listing_price < 42 THEN 'Budget'
            WHEN finance.listing_price >= 42 AND finance.listing_price < 74 THEN 'Average'
            WHEN finance.listing_price >= 74 AND finance.listing_price < 129 THEN 'Expensive'
            ELSE 'Elite' 
       END AS price_category
FROM project.brands
JOIN project.finance
ON brands.product_id = finance.product_id
WHERE brands.brand IS NOT NULL
GROUP BY brands.brand, price_category
ORDER BY total_revenue DESC;