-- Створення нової таблиці GENRE для усунення надмірності
CREATE TABLE GENRE (
    genre_id SERIAL PRIMARY KEY,
    genre_name VARCHAR(40) UNIQUE NOT NULL
);
-- Створення проміжної таблиці для зв'язку багато-до-багатьох
CREATE TABLE MOVIE_GENRE (
    movie_id INTEGER NOT NULL REFERENCES MOVIE(movie_id) ON DELETE CASCADE,
    genre_id INTEGER NOT NULL REFERENCES GENRE(genre_id) ON DELETE CASCADE,
    PRIMARY KEY (movie_id, genre_id)
);
-- Копіювання унікальних жанрів у нову таблицю GENRE
INSERT INTO GENRE (genre_name)
SELECT DISTINCT genre FROM MOVIE;

-- Заповнення MOVIE_GENRE існуючими зв'язками
INSERT INTO MOVIE_GENRE (movie_id, genre_id)
SELECT
    m.movie_id,
    g.genre_id
FROM
    MOVIE m
JOIN
    GENRE g ON m.genre = g.genre_name;
-- Видалення надлишкового стовпця genre з таблиці MOVIE
ALTER TABLE MOVIE
DROP COLUMN genre;
