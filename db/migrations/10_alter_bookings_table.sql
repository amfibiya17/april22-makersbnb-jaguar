ALTER TABLE bookings RENAME user_id TO renter_id;
ALTER TABLE bookings ADD COLUMN owner_id INT REFERENCES users (id);