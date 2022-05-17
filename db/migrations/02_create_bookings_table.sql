CREATE TABLE bookings (
  id SERIAL PRIMARY KEY, 
  user_id INT NOT NULL,
  home_id INT NOT NULL,
  night timestamp
);

INSERT INTO bookings (user_id, home_id, night) VALUES (4, 44, '2022-05-17');