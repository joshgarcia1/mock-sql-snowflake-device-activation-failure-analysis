SELECT d.model,
    a.error_code,
    COUNT(*) AS occurrences
FROM ACTIVATIONS a
JOIN DEVICES d ON a.device_id = d.device_id
WHERE a.activation_status = 'failure'
GROUP BY d.model, a.error_code
ORDER BY occurrences DESC;
