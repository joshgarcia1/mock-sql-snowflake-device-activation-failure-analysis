SELECT d.os_version,
    COUNT(a.activation_id) AS activations,
    SUM(CASE WHEN a.activation_status = 'failure' THEN 1 END) AS failures,
    ROUND(SUM(CASE WHEN a.activation_status = 'failure' THEN 1 END) * 100.0 / COUNT(a.activation_id), 2) AS failure_rate
FROM ACTIVATIONS a
JOIN DEVICES d ON a.device_id = d.device_id
GROUP BY d.os_version
ORDER BY failure_rate DESC;
