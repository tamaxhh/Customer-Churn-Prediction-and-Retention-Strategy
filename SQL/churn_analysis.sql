USE customer_churn;

-- Churn rate
SELECT
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS churn_rate
FROM customers;
/*

+------------+
| churn_rate |
+------------+
|      50.07 |
+------------+
1 row in set (0.01 sec)

*/

-- Churn by contract
SELECT
    Contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS churn_rate
FROM customers
GROUP BY Contract
ORDER BY churn_rate DESC;

/*
+----------------+-----------------+-------------------+------------+
| Contract       | total_customers | churned_customers | churn_rate |
+----------------+-----------------+-------------------+------------+
| Month-to-month |            2421 |              1655 |      68.36 |
| One year       |             647 |               166 |      25.66 |
| Two year       |             665 |                48 |       7.22 |
+----------------+-----------------+-------------------+------------+
3 rows in set (0.02 sec)

*/

-- Churn by Contract and Internet Service

SELECT
    Contract,
    InternetService,
    COUNT(*) AS customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS churn_rate,
    ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charges
FROM customers
GROUP BY Contract, InternetService
ORDER BY churn_rate DESC;

/*

+----------------+-----------------+-----------+---------+------------+---------------------+
| Contract       | InternetService | customers | churned | churn_rate | avg_monthly_charges |
+----------------+-----------------+-----------+---------+------------+---------------------+
| Month-to-month | Fiber optic     |      1495 |    1162 |      77.73 |               86.69 |
| Month-to-month | DSL             |       672 |     394 |      58.63 |                48.9 |
| One year       | Fiber optic     |       262 |     104 |      39.69 |               99.79 |
| Month-to-month | No              |       254 |      99 |      38.98 |               20.45 |
| One year       | DSL             |       245 |      53 |      21.63 |               62.11 |
| Two year       | Fiber optic     |       181 |      31 |      17.13 |              104.74 |
| One year       | No              |       140 |       9 |       6.43 |               20.84 |
| Two year       | DSL             |       242 |      12 |       4.96 |                70.6 |
| Two year       | No              |       242 |       5 |       2.07 |               21.84 |
+----------------+-----------------+-----------+---------+------------+---------------------+
9 rows in set (0.02 sec)

*/