SELECT title
FROM MOVIE
WHERE movie_id IN (
    SELECT movie_id
    FROM SHOWING
    WHERE hall_id = (
        SELECT hall_id
        FROM HALL
        WHERE type_hall = '3D'
    )
);


SELECT full_name,
       (SELECT COUNT(*) FROM BOOKING B WHERE B.customer_id = C.customer_id) AS num_bookings
FROM CUSTOMER C;


SELECT H.name_hall, AVG(T.price) AS average_price
FROM HALL H
JOIN SHOWING S ON H.hall_id = S.hall_id
JOIN TICKET T ON S.session_id = T.session_id
GROUP BY H.name_hall
HAVING AVG(T.price) > (SELECT AVG(price) FROM TICKET);