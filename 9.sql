-- 9.  Footwear product performance
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
SELECT COUNT(*) as num_footwear_products,
       percentile_disc(0.5) WITHIN GROUP(ORDER BY revenue) as median_footwear_revenue
FROM footwear;