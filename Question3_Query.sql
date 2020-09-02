-- Query to find the churn rates for segment 87 and 30

WITH months AS
(
  SELECT 
  '2017-01-01' as first_day,
  '2017-01-31' as last_day
  UNION
  SELECT
  '2017-02-01' as first_day,
  '2017-02-28' as last_day
  UNION
  SELECT
  '2017-03-01' as first_day,
  '2017-03-31' as last_day
),
cross_join AS
(
  SELECT * FROM subscriptions
  CROSS JOIN months
),
status AS
(
  SELECT
  id, first_day AS month,
  CASE
    WHEN (subscription_start < first_day) AND 
    (subscription_end > first_day OR 
    subscription_end IS NULL) AND (segment = 87) 
    THEN 1 ELSE 0
    END AS is_active_87,
  CASE
    WHEN (subscription_start < first_day) AND 
    (subscription_end > first_day OR 
    subscription_end IS NULL) AND (segment = 30) 
    THEN 1 ELSE 0
    END AS is_active_30,
  CASE
    WHEN (subscription_end BETWEEN first_day
    AND last_day) AND (segment = 87)
    THEN 1 ELSE 0
    END AS is_canceled_87,
  CASE
    WHEN (subscription_end BETWEEN first_day
    AND last_day) AND (segment = 30)
    THEN 1 ELSE 0
    END AS is_canceled_30
  FROM cross_join;
),
status_aggregate AS
(
  SELECT SUM(is_active_87) AS sum_active_87
    SUM(is_active_30) AS sum_active_30
    SUM(is_canceled_87) AS sum_canceled_87
    SUM(is_canceled_30) AS sum_canceled_30
  FROM status
  GROUP BY month
) SELECT month,
    ROUND(1.0* sum_canceled_87/sum_active_87, 4) AS       churn_rate_87,
    ROUND(1.0* sum_canceled_30/sum_active_30, 4) AS   churn_rate_30
    FROM status_aggregate;


