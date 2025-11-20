SELECT error_code,
    COUNT(*) AS occurrences
FROM ACTIVATIONS
WHERE activation_status = 'failure'
GROUP BY error_code
ORDER BY occurrences DESC;
