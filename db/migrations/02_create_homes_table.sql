CREATE TABLE homes (
  id SERIAL PRIMARY KEY,
  home_name VARCHAR(50) NOT NULL,
  description VARCHAR(500) NOT NULL,
  price INT NOT NULL,
  user_id INT REFERENCES users (id)
);

