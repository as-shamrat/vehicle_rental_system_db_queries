-- 1
SELECT b.id AS booking_id, u.name AS customer_name, v.name AS vehicle_name, b.start_date, b.end_date, b.status 
FROM bookings AS b INNER JOIN users AS u ON u.id = b.customer_id INNER JOIN vehicles AS v on v.id = b.vehicle_id;

-- 2
SELECT * FROM vehicles AS v WHERE NOT EXISTS (SELECT * FROM bookings AS b WHERE b.vehicle_id = v.id);

-- 3

SELECT * FROM vehicles WHERE type = 'car' AND status = 'available';

-- 4
SELECT v.name AS vehicle_name, COUNT(*) AS total_bookings
FROM bookings AS b INNER JOIN vehicles AS v ON v.id = b.vehicle_id GROUP BY 1 HAVING COUNT(*) > 2;
