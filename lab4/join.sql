SELECT M.title, S.start_time, H.type_hall
FROM SHOWING S
INNER JOIN MOVIE M ON S.movie_id = M.movie_id
INNER JOIN HALL H ON S.hall_id = H.hall_id;


SELECT M.title, S.start_time, H.name_hall
FROM MOVIE M
LEFT JOIN SHOWING S ON M.movie_id = S.movie_id
LEFT JOIN HALL H ON S.hall_id = H.hall_id;


SELECT T.ticket_id, T.price, C.full_name
FROM TICKET T
RIGHT JOIN BOOKING B ON T.booking_id = B.booking_id
RIGHT JOIN CUSTOMER C ON B.customer_id = C.customer_id;