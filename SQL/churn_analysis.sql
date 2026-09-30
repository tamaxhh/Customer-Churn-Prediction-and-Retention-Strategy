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