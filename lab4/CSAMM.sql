
SELECT COUNT(*) AS total_customers
FROM CUSTOMER;


SELECT SUM(total_amount) AS total_revenue
FROM BOOKING;


SELECT AVG(duration) AS average_movie_duration
FROM MOVIE;


SELECT MAX(price) AS max_ticket_price,
       MIN(price) AS min_ticket_price
FROM TICKET;