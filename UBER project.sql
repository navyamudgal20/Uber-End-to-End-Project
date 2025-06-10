CREATE DATABASE UBER;
USE UBER;
#retrieve all successful bookings
SELECT * FROM Bookings WHERE Booking_status="Success";

#Find the avg ride distance for each vehicle type
SELECT vehicle_type, AVG(ride_distance) AS avg_distance
FROM bookings 
GROUP BY vehicle_type;

#total number of cancelled rides by customers
SELECT COUNT(* ) FROM bookings WHERE booking_status="cancelled by customers";

#List the top 5 customers who booked the highest number of rides
SELECT customer_id, COUNT(booking_id) as total_rides
FROM bookings
GROUP BY customer_id
ORDER BY total_rides
LIMIT 5;

#get the no of rides cancelled by drivers due to personal and car related issues
SELECT COUNT(*) FROM bookings WHERE canceled_rides_by_driver="Personal and Car related issues";

#MAX AND MIN driver ratings from PRIME SEDAN
SELECT MAX(driver_ratings)as max_rating,MIN(driver_ratings) as min_rating
FROM bookings
WHERE vehicle_type="PRIME SEDAN";

#RETRIEVE ALL RIDES where payment was using UPI
SELECT * FROM  bookings WHERE payment_method="UPI";

#find the avg customer rating per vehicle type
SELECT vehicle_type,AVG(customer_rating)as avg_customer_rating
FROM bookings
GROUP BY vehicle_type;

#cal the total booking value of rides completed
SELECT SUM(booking_value) as total_successful_value
FROM bookings
WHERE booking_status="Success";

#List all incomplete rides along with the reason
SELECT booking_id, incomplete_rides_reason FROM bookings
WHERE incomplete_rides="yes";