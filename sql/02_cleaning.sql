-- Set context
USE DATABASE ab_test_db;
USE SCHEMA experiment;
USE WAREHOUSE ab_wh;

-- Step 1: Clean raw data (fix types and formatting)
CREATE OR REPLACE TABLE ab_clean AS
SELECT
    TRY_TO_NUMBER(user_id) AS user_id,
    TRY_TO_TIMESTAMP(timestamp) AS event_time,
    LOWER(TRIM(group_type)) AS group_type,
    LOWER(TRIM(landing_page)) AS landing_page,
    TRY_TO_NUMBER(converted) AS converted
FROM ab_raw;

-- Step 2: Remove mismatches (invalid experiment assignments)
CREATE OR REPLACE TABLE ab_filtered AS
SELECT *
FROM ab_clean
WHERE NOT (
    (group_type = 'treatment' AND landing_page = 'old_page')
    OR
    (group_type = 'control' AND landing_page = 'new_page')
);

-- Step 3: Remove duplicate users (keep first occurrence)
CREATE OR REPLACE TABLE ab_final AS
SELECT user_id, event_time, group_type, landing_page, converted
FROM (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY user_id
               ORDER BY event_time
           ) AS rn
    FROM ab_filtered
)
WHERE rn = 1;