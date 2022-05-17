CREATE TABLE users (
  id SERIAL PRIMARY KEY, 
  username VARCHAR(255) NOT NULL UNIQUE,
  email VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL
);

ALTER TABLE users
ADD CONSTRAINT check_min_length 
CHECK (
	length(password) >= 5
	AND length(username) >= 5
	AND length(email) >= 8
);

INSERT INTO users (username, password, email) VALUES ('test_name', 'test_email@test.com', '12345678');