
ALTER TABLE users
ADD CONSTRAINT check_min_length 
CHECK (
	length(password) >= 5
	AND length(username) >= 5
	AND length(email) >= 8
);

-- Sample insert statement - don't insert manually
INSERT INTO users (username, password, email) VALUES ('test_name', 'test_email@test.com', '12345678');