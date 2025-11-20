SELECT l.location_id,
    l.restaurant_name,
    COUNT(*) AS total_attempts,
    SUM(CASE WHEN activation_status = 'failure' THEN 1 END) AS failures,
    ROUND(SUM(CASE WHEN activation_status = 'failure' THEN 1 END) * 100.0 / COUNT(*), 2) AS failure_rate
FROM ACTIVATIONS a
JOIN DEVICES d ON a.device_id = d.device_id
JOIN LOCATIONS l ON d.location_id = l.location_id
GROUP BY l.location_id, l.restaurant_name
HAVING ROUND(SUM(CASE WHEN activation_status = 'failure' THEN 1 END) * 100.0 / COUNT(*), 2) > 15
ORDER BY failure_rate DESC;
