ALTER TABLE requests RENAME user_id TO renter_id;
ALTER TABLE requests ADD COLUMN owner_id INT REFERENCES users (id);