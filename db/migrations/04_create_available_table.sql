CREATE TABLE available (
  id SERIAL PRIMARY KEY, 
  home_id INT REFERENCES homes (id),
  night timestamp
);

