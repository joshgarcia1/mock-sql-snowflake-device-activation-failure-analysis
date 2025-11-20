SELECT d.os_version,
    d.model,
    COUNT(*) AS attempts,
    SUM(CASE WHEN a.activation_status = 'failure' THEN 1 END) AS failures,
    ROUND(SUM(CASE WHEN a.activation_status = 'failure' THEN 1 END) * 100.0 / COUNT(*), 2) AS failure_rate
FROM ACTIVATIONS a
JOIN DEVICES d ON a.device_id = d.device_id
GROUP BY d.os_version, d.model
ORDER BY failure_rate DESC;
