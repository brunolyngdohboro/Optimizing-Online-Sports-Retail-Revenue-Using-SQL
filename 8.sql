-- 8. Top Revenue Generated Products with Brands
WITH highest_revenue_product AS
(  
   SELECT info.product_name,
          brands.brand,
          revenue
   FROM project.finance
   JOIN project.info
   ON finance.product_id = info.product_id
   JOIN project.brands
   ON brands.product_id = info.product_id
   WHERE product_name IS NOT NULL 
     AND revenue IS NOT NULL 
     AND brand IS NOT NULL
)
SELECT product_name,
       brand,
       revenue,
        RANK() OVER (ORDER BY revenue DESC) AS product_rank
FROM highest_revenue_product
LIMIT 10;