-- 7.Reviews by month and brand
SELECT brands.brand, 
       DATE_PART('month', last_visited) as month,
       COUNT(reviews.*) as num_reviews
FROM project.brands
JOIN project.traffic
ON brands.product_id = traffic.product_id
JOIN project.reviews
ON reviews.product_id = traffic.product_id
WHERE brands.brand IS NOT NULL
GROUP BY brands.brand, month
HAVING DATE_PART('month', last_visited) IS NOT NULL
ORDER BY brands.brand, month;

