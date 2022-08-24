CREATE TABLE coffees (
    id serial PRIMARY KEY,
    name VARCHAR (255) NOT NULL UNIQUE,
    teaser VARCHAR(255) NULL,
    description TEXT NULL,
    price INT NOT NULL,
    image TEXT,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    deleted_at TIMESTAMP
);
CREATE TABLE ingredients (
    id serial PRIMARY KEY,
    name VARCHAR (255) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    deleted_at TIMESTAMP
);
CREATE TABLE coffee_ingredients (
    id serial PRIMARY KEY,
    coffee_id int references coffees(id),
    ingredient_id int references ingredients(id),
    quantity int NOT NULL,
    unit VARCHAR (50) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    deleted_at TIMESTAMP,
    CONSTRAINT unique_coffee_ingredient UNIQUE (coffee_id,ingredient_id)
);
CREATE TABLE users (
    id serial PRIMARY KEY,
    username VARCHAR (255) NOT NULL UNIQUE,
    password TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    deleted_at TIMESTAMP
);
CREATE TABLE tokens (
    id serial PRIMARY KEY,
    user_id int references users(id),
    created_at TIMESTAMP NOT NULL,
    deleted_at TIMESTAMP
);
CREATE TABLE orders (
    id serial PRIMARY KEY,
    user_id int references users(id),
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    deleted_at TIMESTAMP
);
CREATE TABLE order_items (
    id serial PRIMARY KEY,
    order_id int references orders(id),
    coffee_id int references coffees(id),
    quantity int NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    deleted_at TIMESTAMP
);