-- 5. Correlation between revenue and reviews
SELECT CORR(finance.revenue, reviews.reviews) AS review_revenue_corr
FROM project.finance
JOIN project.reviews
ON finance.product_id = reviews.product_id;