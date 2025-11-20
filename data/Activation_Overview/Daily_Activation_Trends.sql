SELECT DATE(activation_timestamp) AS activation_date,
    COUNT(*) AS total_activations,
    SUM(CASE WHEN activation_status = 'failure' THEN 1 ELSE 0 END) AS failures
FROM ACTIVATIONS
GROUP BY activation_date
ORDER BY activation_date;
