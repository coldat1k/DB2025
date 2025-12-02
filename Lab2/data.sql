INSERT INTO HALL (name_hall, type_hall) VALUES
('Зала 1','3D'),
('Зала 2','2D'),
('Зала 3','VIP');

INSERT INTO CUSTOMER (full_name, email_address, phone_number) VALUES
('Савицький Юрій','savytskyi.yurii@gmail.com', '380962130596'),
('Мороз Максим','morozov.maksym200@gmail.com', '380932003004'),
('Тухлий Дмитро','tyhliy.dmitro300@gmail.com', '380672283001'),
('Дмитро Романов','dimka228adidas@gmail.com.', '380501337228');

INSERT INTO MOVIE (title, release_date, duration, genre) VALUES
('Сіністер', '2012-11-15', 110, 'Жахи'),
('Поворот не туди', '2003-05-30', 84, 'Жахи'),
('21 міст', '2019-11-22', 110, 'Кримінал'),
('Дорога', '2009-10-08', 113, 'Трилер'),
('Інтерстеллар', '2014-11-06', 209, 'Наукова фантастика');


INSERT INTO SHOWING (movie_id, hall_id, start_time) VALUES
(1, 1, NOW() + INTERVAL '1hour'),
(2, 3, NOW() + INTERVAL '30minutes'),
(3, 1, NOW() + INTERVAL '4hours');

INSERT INTO SEAT (hall_id, row_num, seat_number) VALUES
(1, 1, 1), (1, 1, 2), (1, 1, 3),
(1, 2, 1), (1, 2, 2), (1, 2, 3),
(1, 3, 1), (1, 3, 2), (1, 3, 3);
INSERT INTO SEAT (hall_id, row_num, seat_number) VALUES
(2, 1, 1), (2, 1, 2), (2, 1, 3),
(2, 2, 1), (2, 2, 2), (2, 2, 3),
(2, 3, 1), (2, 3, 2), (2, 3, 3);

INSERT INTO SEAT (hall_id, row_num, seat_number) VALUES
(3, 1, 1), (3, 1, 2), (3, 1, 3),
(3, 2, 1), (3, 2, 2), (3, 2, 3),
(3, 3, 1), (3, 3, 2), (3, 3, 3);

INSERT INTO BOOKING (customer_id, total_amount) VALUES 
('1', 300.00),
('2', 400.00),
('1', 150.00);

INSERT INTO TICKET (booking_id, session_id, seat_id, price) VALUES
(1, 3, 1, 150.00),
(1, 3, 2, 150.00);

INSERT INTO TICKET (booking_id, session_id, seat_id, price) VALUES
(2, 2, 6, 200.00),
(2, 2, 7, 200.00);

INSERT INTO TICKET (booking_id, session_id, seat_id, price) VALUES
(1, 3, 3, 150.00);
