SELECT COUNT(view_time) 
    FILTER (WHERE device_type ='laptop') AS laptop_views,
    COUNT(view_time) 
    FILTER (WHERE device_type IN('tablet', 'phone')) AS mobile_views
FROM viewership;