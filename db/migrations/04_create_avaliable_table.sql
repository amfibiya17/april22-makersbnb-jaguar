CREATE TABLE avaliable (
  id SERIAL PRIMARY KEY, 
  home_id INT NOT NULL,
  night timestamp
);

INSERT INTO avaliable (home_id, night) VALUES (44, '2022-05-17');