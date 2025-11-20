SELECT COUNT(*) AS total_activations,
    SUM(CASE WHEN activation_status = 'failure' THEN 1 ELSE 0 END) AS total_failures,
    ROUND(SUM(CASE WHEN activation_status = 'failure' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS failure_rate_percentage
FROM ACTIVATIONS;
