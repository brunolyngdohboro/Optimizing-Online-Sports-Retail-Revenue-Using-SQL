-- 4. Average discount by brand
SELECT brands.brand,
       AVG(discount)*100 as average_discount
FROM project.brands
JOIN project.finance
ON brands.product_id = finance.product_id
WHERE brands.brand IS NOT NULL
GROUP BY brands.brand;