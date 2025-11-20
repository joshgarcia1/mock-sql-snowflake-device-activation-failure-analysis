SELECT l.region,
    d.os_version,
    COUNT(a.activation_id) AS attempts,
    SUM(CASE WHEN a.activation_status = 'failure' THEN 1 END) AS failures,
    ROUND(SUM(CASE WHEN a.activation_status = 'failure' THEN 1 END) * 100.0 / COUNT(*), 2) AS failure_rate
FROM ACTIVATIONS a
JOIN DEVICES d ON a.device_id = d.device_id
JOIN LOCATIONS l ON d.location_id = l.location_id
GROUP BY l.region, d.os_version
ORDER BY failure_rate DESC;
