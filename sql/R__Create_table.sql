CREATE TABLE demo (
	id SERIAL PRIMARY KEY,
	url VARCHAR(255) NOT NULL,
	name VARCHAR(255) NOT NULL,
	description VARCHAR (255),
    last_update DATE,
	url_type VARCHAR(255) NOT NULL
);

INSERT INTO demo (url, name)
VALUES('https://www.postgresqltutorial.com','PostgreSQL Tutorial');