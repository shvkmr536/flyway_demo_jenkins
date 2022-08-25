CREATE TABLE demo_2 (
	id SERIAL PRIMARY KEY,
	url VARCHAR(255) NOT NULL,
	name VARCHAR(255) NOT NULL,
	description VARCHAR (255),
    last_update DATE
);

INSERT INTO demo_2 (url, name)
VALUES('https://www.postgresqltutorial.com','PostgreSQL Tutorial');