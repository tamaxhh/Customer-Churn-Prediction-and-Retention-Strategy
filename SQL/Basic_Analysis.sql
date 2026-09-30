USE customer_churn;

-- 1. Total customers
SELECT COUNT(*) AS total_customers
FROM customers;

/*
+-----------------+
| total_customers |
+-----------------+
|            3733 |
+-----------------+
1 row in set (0.01 sec)

*/

-- 2. Churned customers
SELECT COUNT(*) AS churned_customers
FROM customers
WHERE Churn = 'Yes';

/*
+-------------------+
| churned_customers |
+-------------------+
|              1869 |
+-------------------+
1 row in set (0.01 sec)

*/

-- 3. Retained customers
SELECT COUNT(*) AS retained_customers
FROM customers
WHERE Churn = 'No';

/*
+--------------------+
| retained_customers |
+--------------------+
|               1864 |
+--------------------+
1 row in set (0.01 sec)

*/

-- 4. Average monthly charges
SELECT ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charges
FROM customers;

/*
+---------------------+
| avg_monthly_charges |
+---------------------+
|               67.84 |
+---------------------+
1 row in set (0.01 sec)

*/


