CREATE TABLE bookings (
  id SERIAL PRIMARY KEY, 
  user_id INT REFERENCES users (id),
  home_id INT REFERENCES homes (id),
  night timestamp
);

INSERT INTO bookings (user_id, home_id, night) VALUES (1, 1, '2022-05-17');