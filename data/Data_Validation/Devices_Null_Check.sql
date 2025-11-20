SELECT COUNT(*) AS null_devices 
FROM DEVICES 
WHERE device_id IS NULL 
   OR device_type IS NULL 
   OR location_id IS NULL;
