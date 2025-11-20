SELECT error_code,
    COUNT(*) AS occurrences,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM ACTIVATIONS WHERE activation_status = 'failure')
    , 2) AS percent_of_all_failures
FROM ACTIVATIONS
WHERE activation_status = 'failure'
GROUP BY error_code
ORDER BY occurrences DESC;
