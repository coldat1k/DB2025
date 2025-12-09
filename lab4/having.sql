SELECT H.name_hall, COUNT(S.seat_id) AS total_seats
FROM HALL H
JOIN SEAT S ON H.hall_id = S.hall_id
GROUP BY H.name_hall
HAVING COUNT(S.seat_id) > 9;


SELECT C.full_name, COUNT(B.booking_id) AS num_bookings
FROM CUSTOMER C
JOIN BOOKING B ON C.customer_id = B.customer_id
GROUP BY C.full_name
HAVING COUNT(B.booking_id) > 1;