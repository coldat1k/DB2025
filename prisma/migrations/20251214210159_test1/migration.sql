-- CreateTable
CREATE TABLE "booking" (
    "booking_id" SERIAL NOT NULL,
    "customer_id" INTEGER NOT NULL,
    "total_amount" DECIMAL(8,2) NOT NULL,

    CONSTRAINT "booking_pkey" PRIMARY KEY ("booking_id")
);

-- CreateTable
CREATE TABLE "customer" (
    "customer_id" SERIAL NOT NULL,
    "full_name" VARCHAR(100) NOT NULL,
    "email_address" VARCHAR(100) NOT NULL,
    "phone_number" VARCHAR(15) NOT NULL,

    CONSTRAINT "customer_pkey" PRIMARY KEY ("customer_id")
);

-- CreateTable
CREATE TABLE "genre" (
    "genre_id" SERIAL NOT NULL,
    "genre_n" VARCHAR(40) NOT NULL,

    CONSTRAINT "genre_pkey" PRIMARY KEY ("genre_id")
);

-- CreateTable
CREATE TABLE "hall" (
    "hall_id" SERIAL NOT NULL,
    "name_hall" VARCHAR(10) NOT NULL,
    "type_hall" VARCHAR(15) NOT NULL,

    CONSTRAINT "hall_pkey" PRIMARY KEY ("hall_id")
);

-- CreateTable
CREATE TABLE "movie" (
    "movie_id" SERIAL NOT NULL,
    "title" VARCHAR(40) NOT NULL,
    "release_date" DATE NOT NULL,
    "duration" INTEGER NOT NULL,

    CONSTRAINT "movie_pkey" PRIMARY KEY ("movie_id")
);

-- CreateTable
CREATE TABLE "movie_genre" (
    "movie_id" INTEGER NOT NULL,
    "genre_id" INTEGER NOT NULL,

    CONSTRAINT "movie_genre_pkey" PRIMARY KEY ("movie_id","genre_id")
);

-- CreateTable
CREATE TABLE "seat" (
    "seat_id" SERIAL NOT NULL,
    "hall_id" INTEGER NOT NULL,
    "row_num" INTEGER NOT NULL,
    "seat_number" INTEGER NOT NULL,

    CONSTRAINT "seat_pkey" PRIMARY KEY ("seat_id")
);

-- CreateTable
CREATE TABLE "showing" (
    "session_id" SERIAL NOT NULL,
    "movie_id" INTEGER NOT NULL,
    "hall_id" INTEGER NOT NULL,
    "start_time" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "showing_pkey" PRIMARY KEY ("session_id")
);

-- CreateTable
CREATE TABLE "ticket" (
    "ticket_id" SERIAL NOT NULL,
    "booking_id" INTEGER NOT NULL,
    "session_id" INTEGER NOT NULL,
    "seat_id" INTEGER NOT NULL,
    "price" DECIMAL(6,2) NOT NULL,

    CONSTRAINT "ticket_pkey" PRIMARY KEY ("ticket_id")
);

-- CreateTable
CREATE TABLE "services" (
    "services_id" SERIAL NOT NULL,
    "popcorn" BOOLEAN NOT NULL,
    "glasses" BOOLEAN NOT NULL,

    CONSTRAINT "services_pkey" PRIMARY KEY ("services_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "customer_email_address_key" ON "customer"("email_address");

-- CreateIndex
CREATE UNIQUE INDEX "genre_genre_n_key" ON "genre"("genre_n");

-- CreateIndex
CREATE UNIQUE INDEX "hall_name_hall_key" ON "hall"("name_hall");

-- CreateIndex
CREATE UNIQUE INDEX "uq_seatlocation" ON "seat"("hall_id", "row_num", "seat_number");

-- CreateIndex
CREATE UNIQUE INDEX "uq_halltime" ON "showing"("hall_id", "start_time");

-- CreateIndex
CREATE UNIQUE INDEX "uq_ticket" ON "ticket"("session_id", "seat_id");

-- AddForeignKey
ALTER TABLE "booking" ADD CONSTRAINT "booking_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "customer"("customer_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "movie_genre" ADD CONSTRAINT "movie_genre_genre_id_fkey" FOREIGN KEY ("genre_id") REFERENCES "genre"("genre_id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "movie_genre" ADD CONSTRAINT "movie_genre_movie_id_fkey" FOREIGN KEY ("movie_id") REFERENCES "movie"("movie_id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "seat" ADD CONSTRAINT "seat_hall_id_fkey" FOREIGN KEY ("hall_id") REFERENCES "hall"("hall_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "showing" ADD CONSTRAINT "showing_hall_id_fkey" FOREIGN KEY ("hall_id") REFERENCES "hall"("hall_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "showing" ADD CONSTRAINT "showing_movie_id_fkey" FOREIGN KEY ("movie_id") REFERENCES "movie"("movie_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ticket" ADD CONSTRAINT "ticket_booking_id_fkey" FOREIGN KEY ("booking_id") REFERENCES "booking"("booking_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ticket" ADD CONSTRAINT "ticket_seat_id_fkey" FOREIGN KEY ("seat_id") REFERENCES "seat"("seat_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ticket" ADD CONSTRAINT "ticket_session_id_fkey" FOREIGN KEY ("session_id") REFERENCES "showing"("session_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
