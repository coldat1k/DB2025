SELECT * FROM CUSTOMER;

SELECT full_name, email_address FROM CUSTOMER;

SELECT title, genre FROM MOVIE;

SELECT session_id, start_time FROM SHOWING;

SELECT title, genre, duration FROM MOVIE WHERE duration > 50;

SELECT * FROM SHOWING WHERE DATE(start_time) = '2025-12-31';

SELECT customer_id, booking_id, total_amount FROM BOOKING WHERE total_amount > 300;