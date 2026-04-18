# A/B Testing Analysis: Evaluating Landing Page Performance

## 📌 Overview

This project evaluates whether a new landing page (treatment) improves user conversion compared to the existing landing page (control). The analysis was conducted using Snowflake for data storage and SQL processing, and Python for statistical testing and visualisation.

---

## Objective

To determine whether the new landing page leads to a statistically significant increase in conversion rate.

---

##  Tools & Technologies

* **Snowflake** – cloud data warehouse for data storage and processing
* **SQL** – data cleaning, validation, and aggregation
* **Python (pandas, SciPy, matplotlib)** – data analysis and statistical testing
* **Jupyter Notebook** – analysis and reporting
* **GitHub** – project version control and presentation

---

## Dataset

The dataset contains user-level data from an A/B test, including:

* `user_id`
* `timestamp`
* `group_type` (control or treatment)
* `landing_page` (old_page or new_page)
* `converted` (0 = no conversion, 1 = conversion)

---

## Workflow

### 1. Data Ingestion

* Raw dataset loaded into Snowflake (`ab_raw`)

### 2. Data Cleaning (SQL)

* Converted data types (user_id, timestamp, converted)
* Standardised text fields (group_type, landing_page)
* Removed invalid or missing records

### 3. Experiment Validation

* Identified mismatches between assigned groups and landing pages
* Removed inconsistent observations to ensure experiment integrity

### 4. Duplicate Handling

* Removed duplicate users using window functions

### 5. Final Dataset

* Created a cleaned dataset (`ab_final`) for analysis

### 6. Analysis

* Calculated conversion rates using SQL
* Exported cleaned data to Python for statistical testing

---

## Results

| Group     | Users   | Conversions | Conversion Rate |
| --------- | ------- | ----------- | --------------- |
| Control   | 145,274 | 17,489      | 12.04%          |
| Treatment | 145,310 | 17,264      | 11.88%          |

---

## Statistical Testing

A two-sample t-test was performed to evaluate whether the difference in conversion rates is statistically significant.

* **T-statistic:** -1.31
* **P-value:** 0.1899

### Interpretation

Since the p-value (0.1899) is greater than the significance level (0.05), we fail to reject the null hypothesis.

---

##  Conclusion

The analysis shows that the treatment group had a slightly lower conversion rate than the control group. However, the difference is not statistically significant. Therefore, there is insufficient evidence to conclude that the new landing page improves user conversion.

**Recommendation:** Retain the existing landing page.

---

## 📂 Project Structure

```
A-B-Project/
│
├── data/
│   ├── ab_data.csv        # Raw dataset
│   ├── ab_final.csv       # Cleaned dataset
│
├── notebooks/
│   └── ab_test_analysis.ipynb
│
├── sql/
│   ├── 01_setup.sql
│   ├── 02_cleaning.sql
│   ├── 03_validation.sql
│   ├── 04_analysis.sql
│
├── README.md
└── requirements.txt
```

---

## Key Skills Demonstrated

* Data cleaning and transformation using SQL
* Experiment validation and integrity checks
* Statistical hypothesis testing
* Data analysis and visualisation in Python
* End-to-end data workflow design


---

## Author

**Esther Edoho**
MSc Data Science | Data Analyst | Python, SQL, Snowflake

---
