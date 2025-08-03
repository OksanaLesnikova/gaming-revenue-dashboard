# 🎮 Subscription Revenue Metrics (SQL)   https://public.tableau.com/app/profile/oksana.lesnikova/viz/Revenue_Metrics_Dashboard_17532814141730/UserRetentionandRevenueAnalysis
https://drive.google.com/file/d/1qiyrymAdi7J15VqQU8XU479ElUT6Cwyb/view?usp=drive_link

This project calculates key revenue metrics for a gaming platform using SQL, based on user payment data.

## 📊 Metrics Included

- **Monthly Recurring Revenue (MRR)**
- **New MRR** – revenue from new paying users
- **Expansion MRR** – increased revenue from existing users
- **Contraction MRR** – decreased revenue from existing users
- **Churned Revenue** – revenue lost from users who stopped paying
- **Churned Users** – users who churned month-over-month

## 🧠 SQL Techniques Used

- `CTE` (Common Table Expressions)
- `LAG()` and `LEAD()` window functions
- `CASE WHEN` logic for metric classification
- Month-over-month comparison

## 📌 Business Use Case

This script helps identify user behavior trends and revenue changes over time, which is essential for:
- Retention analysis
- Forecasting
- Understanding growth and churn dynamics

## 📈 Dashboard Example

This SQL script powers an interactive Tableau dashboard:

👉 [View Tableau Dashboard](https://public.tableau.com/app/profile/oksana.lesnikova/viz/Revenue_Metrics_Dashboard_17532814141730/UserRetentionandRevenueAnalysis)

## 🚀 How to Use

1. Run the script in your SQL environment (e.g. BigQuery, PostgreSQL)
2. Modify table names if needed
3. Use results in BI tools like Tableau or Power BI

---

📁 Sample file: `mrr_metrics.sql`
