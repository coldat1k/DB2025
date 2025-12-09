SELECT H.name_hall, COUNT(S.seat_id) AS total_seats
FROM HALL H
JOIN SEAT S ON H.hall_id = S.hall_id
GROUP BY H.name_hall;


SELECT C.full_name, SUM(B.total_amount) AS total_spent
FROM CUSTOMER C
JOIN BOOKING B ON C.customer_id = B.customer_id
GROUP BY C.full_name
ORDER BY total_spent DESC;


SELECT genre, COUNT(movie_id) AS num_movies
FROM MOVIE
GROUP BY genre;