CREATE TABLE requests (
  id SERIAL PRIMARY KEY, 
  user_id INT REFERENCES users (id),
  home_id INT REFERENCES homes (id),
  night timestamp
);
