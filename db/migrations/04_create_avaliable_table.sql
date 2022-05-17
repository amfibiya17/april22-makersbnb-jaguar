CREATE TABLE avaliable (
  id SERIAL PRIMARY KEY, 
  home_id INT REFERENCES homes (id),
  night timestamp
);

INSERT INTO avaliable (home_id, night) VALUES (1, '2022-05-17');