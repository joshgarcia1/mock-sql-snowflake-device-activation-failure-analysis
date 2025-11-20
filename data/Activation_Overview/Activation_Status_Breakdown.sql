SELECT activation_status,
    COUNT(*) AS count
FROM ACTIVATIONS
GROUP BY activation_status;
