INSERT INTO MOVIE (title, release_date, duration, genre) VALUES
('Дивні дива 5', '2025-11-28', 340.10, 'Фантастика');



INSERT INTO BOOKING (customer_id, total_amount) VALUES 
(5, 300.00);

INSERT INTO TICKET (booking_id, session_id, seat_id, price) VALUES
(4, 3, 8, 150.00),
(4, 3, 9, 150.00);

INSERT INTO CUSTOMER (full_name, email_address, phone_number) VALUES
('Голод Петро', 'holod.petya@gmail.com', '380693003396');
SELECT * FROM CUSTOMER WHERE full_name = 'Голод Петро';