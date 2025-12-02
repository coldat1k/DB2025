DROP TABLE IF EXISTS TICKET;
DROP TABLE IF EXISTS BOOKING;
DROP TABLE IF EXISTS SHOWING;
DROP TABLE IF EXISTS SEAT;
DROP TABLE IF EXISTS CUSTOMER;
DROP TABLE IF EXISTS MOVIE;
DROP TABLE IF EXISTS HALL;


CREATE TABLE HALL
(
	hall_id SERIAL PRIMARY KEY,
	name_hall VARCHAR(10) UNIQUE NOT NULL,
	type_hall varchar(15) NOT NULL
);


CREATE TABLE CUSTOMER 
(
	customer_id SERIAL PRIMARY KEY,
	full_name varchar(100) NOT NULL,
	email_address varchar(100) UNIQUE NOT NULL, 
	phone_number varchar(15) NOT NULL
);


CREATE TABLE MOVIE
(
	movie_id SERIAL PRIMARY KEY,
	title varchar(40) NOT NULL,
	release_date DATE NOT NULL,
	duration integer NOT NULL CHECK(duration > 0),
	genre varchar(40) NOT NULL
);


CREATE TABLE SHOWING
(
	session_id SERIAL PRIMARY KEY,
	movie_id INTEGER NOT NULL REFERENCES MOVIE(movie_id),
	hall_id INTEGER NOT NULL REFERENCES HALL(hall_id),
	start_time TIMESTAMP WITH TIME ZONE  NOT NULL,
	CONSTRAINT UQ_HallTime UNIQUE (hall_id, start_time)
);	


CREATE TABLE SEAT 
(
	seat_id SERIAL PRIMARY KEY,
	hall_id integer NOT NULL REFERENCES HALL(hall_id),
	row_num integer NOT NULL CHECK(row_num > 0),
	seat_number integer NOT NULL CHECK(seat_number >0),
	CONSTRAINT UQ_SeatLocation UNIQUE (hall_id, row_num, seat_number)
);


CREATE TABLE BOOKING 
(
	booking_id  SERIAL PRIMARY KEY,
	customer_id INTEGER NOT NULL REFERENCES CUSTOMER(customer_id), 
	booking_date TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
	total_amount NUMERIC(8,2) NOT NULL CHECK (total_amount >= 0)
);


CREATE TABLE TICKET
(
	ticket_id SERIAL PRIMARY KEY,
	booking_id INTEGER NOT NULL REFERENCES BOOKING(booking_id),
	session_id INTEGER NOT NULL REFERENCES SHOWING(session_id),
	seat_id INTEGER NOT NULL REFERENCES SEAT(seat_id),
	price NUMERIC (6,2) NOT NULL CHECK (price > 0),
	CONSTRAINT UQ_Ticket UNIQUE (session_id, seat_id)
);


