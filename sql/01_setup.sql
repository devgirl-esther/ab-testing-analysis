 A/B Testing Project (Snowflake SQL)
-- Author: Esther Edoho
-- Description: Data cleaning, validation, and analysis pipeline


-- Create database
CREATE OR REPLACE DATABASE ab_test_db;

-- Use database
USE DATABASE ab_test_db;

-- Create schema
CREATE OR REPLACE SCHEMA experiment;

-- Use schema
USE SCHEMA experiment;

-- Create warehouse
CREATE OR REPLACE WAREHOUSE ab_wh
  WAREHOUSE_SIZE = 'XSMALL'
  AUTO_SUSPEND = 60
  AUTO_RESUME = TRUE;

-- Use warehouse
USE WAREHOUSE ab_wh;

-- Create raw table
CREATE OR REPLACE TABLE ab_raw (
    user_id STRING,
    timestamp STRING,
    group_type STRING,
    landing_page STRING,
    converted STRING
);