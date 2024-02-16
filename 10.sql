-- 10. Clothing product performance
WITH footwear AS 
( SELECT info.description, 
         finance.revenue
  FROM project.info
  INNER JOIN project.finance
  ON info.product_id = finance.product_id
  WHERE info.description ILIKE '%shoe%' 
        OR info.description ILIKE '%trainer%' 
        OR info.description ILIKE '%foot%' 
        AND info.description IS NOT NULL 
)
SELECT COUNT(info.*) AS num_clothing_products,
       percentile_disc(0.5) WITHIN GROUP(ORDER BY revenue) AS median_clothing_revenue
FROM project.info
INNER JOIN project.finance
ON info.product_id = finance.product_id
WHERE info.description NOT IN (select description from footwear);