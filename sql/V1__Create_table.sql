CREATE TABLE demo_1 (
	id SERIAL PRIMARY KEY,
	url VARCHAR(255) NOT NULL,
	name VARCHAR(255) NOT NULL,
	description VARCHAR (255),
    last_update DATE
);

INSERT INTO demo_1 (url, name)
VALUES('https://www.postgresqltutorial.com','PostgreSQL Tutorial');