-- Are devices on OS 4.2 failing more often?
SELECT os_version,
    ROUND(SUM(CASE WHEN activation_status = 'failure' THEN 1 END) * 100.0 / COUNT(*), 2) AS failure_rate
FROM ACTIVATIONS a
JOIN DEVICES d ON a.device_id = d.device_id
GROUP BY os_version
ORDER BY failure_rate DESC;
