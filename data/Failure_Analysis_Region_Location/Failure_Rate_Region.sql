SELECT l.region,
    COUNT(a.activation_id) AS total_attempts,
    SUM(CASE WHEN a.activation_status = 'failure' THEN 1 END) AS failures,
    ROUND(SUM(CASE WHEN a.activation_status = 'failure' THEN 1 END) * 100.0 / COUNT(a.activation_id), 2) AS failure_rate
FROM ACTIVATIONS a
JOIN DEVICES d ON a.device_id = d.device_id
JOIN LOCATIONS l ON d.location_id = l.location_id
GROUP BY l.region
ORDER BY failure_rate DESC;
