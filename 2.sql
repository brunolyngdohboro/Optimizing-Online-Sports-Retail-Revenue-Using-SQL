-- 2. Nike vs Adidas pricing
SELECT brands.brand, 
       CAST(listing_price AS Integer) AS listing_price, 
       COUNT(*) AS count
FROM project.brands
JOIN project.finance
ON project.brands.product_id = project.finance.product_id
WHERE project.finance.listing_price > 0
GROUP BY brands.brand, finance.listing_price
ORDER BY listing_price DESC;