-- Set context
USE DATABASE ab_test_db;
USE SCHEMA experiment;
USE WAREHOUSE ab_wh;

-- Check group distribution
SELECT group_type, COUNT(*) AS users
FROM ab_raw
GROUP BY group_type;

-- Check landing page distribution
SELECT landing_page, COUNT(*) AS users
FROM ab_raw
GROUP BY landing_page;

-- Check mismatch breakdown
SELECT
    group_type,
    landing_page,
    COUNT(*) AS users
FROM ab_clean
GROUP BY group_type, landing_page
ORDER BY group_type, landing_page;

-- Count mismatches
SELECT COUNT(*) AS mismatch_count
FROM ab_clean
WHERE
    (group_type = 'treatment' AND landing_page = 'old_page')
    OR
    (group_type = 'control' AND landing_page = 'new_page');

-- Confirm no mismatches remain after filtering
SELECT
    group_type,
    landing_page,
    COUNT(*) AS users
FROM ab_filtered
GROUP BY group_type, landing_page;

-- Check for duplicates
SELECT COUNT(*) - COUNT(DISTINCT user_id) AS duplicate_users
FROM ab_final;