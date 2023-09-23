WITH summary AS(
    SELECT item_type, SUM(square_footage) AS total_squ_feet, 
         COUNT(item_id) AS num_items
    FROM inventory
    GROUP BY item_type),
    
prime_items AS(
    SELECT item_type, total_squ_feet,
      FLOOR(500000/total_squ_feet) AS num_each_item,
      FLOOR(500000/total_squ_feet)* num_items AS item_prime_count
    FROM summary
    WHERE item_type = 'prime_eligible')
    
SELECT item_type,
    CASE 
      WHEN item_type = 'prime_eligible' 
        THEN (FLOOR(500000/total_squ_feet)* num_items)
      WHEN item_type = 'not_prime'
        THEN (FLOOR((500000 - 
          (SELECT num_each_item * total_squ_feet
           FROM prime_items))/total_squ_feet)* num_items)
      END AS item_count
FROM summary 
ORDER BY item_type DESC;