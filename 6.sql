-- 6. Ratings and reviews by product description length
SELECT TRUNC(Length(description)/100.0) *100 as description_length,
       ROUND(AVG(CAST(rating As numeric)),2) as  average_rating
FROM project.info
JOIN project.reviews
ON info.product_id = reviews.product_id
WHERE description IS NOT NULL
GROUP BY description_length
ORDER BY description_length;