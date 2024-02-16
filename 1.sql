-- Analysis 
-- 1. Counting missing values
SELECT count(*) as total_rows,
    count(info.description) as count_description,
    count(finance.listing_price) as count_listing_price,
    count(traffic.last_visited) as count_last_visited
FROM project.info
JOIN project.finance
ON project.info.product_id = project.finance.product_id 
JOIN project.traffic
ON project.info.product_id = project.traffic.product_id;