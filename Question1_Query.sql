-- Query to find the first and last subscription date

SELECT 
	MIN(subscription_start) as ‘First',
	MAX(subscription_start) as ”Last”
FROM subscriptions;
