SELECT d.device_type,
    d.model,
    d.os_version,
    COUNT(*) AS activations,
    SUM(CASE WHEN a.activation_status = 'failure' THEN 1 END) AS failures,
    ROUND(SUM(CASE WHEN a.activation_status = 'failure' THEN 1 END) * 100.0 / COUNT(*), 2) AS failure_rate
FROM ACTIVATIONS a
JOIN DEVICES d ON a.device_id = d.device_id
GROUP BY d.device_type, d.model, d.os_version
HAVING COUNT(*) > 50
ORDER BY failure_rate DESC;
