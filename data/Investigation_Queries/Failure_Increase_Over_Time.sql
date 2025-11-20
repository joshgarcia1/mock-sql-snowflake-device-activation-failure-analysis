-- Are failures increasing over time?
SELECT DATE(activation_timestamp) AS date,
    SUM(CASE WHEN activation_status = 'failure' THEN 1 END) AS failures
FROM ACTIVATIONS
GROUP BY date
ORDER BY date;
