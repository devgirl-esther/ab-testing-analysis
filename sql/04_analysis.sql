-- Set context
USE DATABASE ab_test_db;
USE SCHEMA experiment;
USE WAREHOUSE ab_wh;

-- Conversion rate analysis
SELECT
    group_type,
    COUNT(*) AS users,
    SUM(converted) AS conversions,
    ROUND(AVG(converted), 5) AS conversion_rate
FROM ab_final
GROUP BY group_type
ORDER BY group_type;