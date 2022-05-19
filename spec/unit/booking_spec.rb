require 'booking'
require 'pg'

describe Booking do
  describe '.check' do
    it 'can see if a booking with a home and a date is available and return true' do
      home_name = 'Waterloo 25'
      night = '2022-05-16'
      #create a user using the user class (already written)
      user = User.create(username: 'test_name', password: '12345678', email: 'test@email.com')
      #connect to the test table
      connection = PG.connect(dbname: "makersbnb_test")
      #put some data into the homes table 
      home = connection.exec("INSERT INTO homes (home_name, description, price, user_id) VALUES($1, $2, $3, $4) RETURNING id, home_name;", 
      ["#{home_name}", 'This is the description', 500, 1])
      #insert some data into the available table
      connection.exec("INSERT INTO available (home_id, night) VALUES($1, $2);", ["#{home[0]['id']}", night])
      expect(Booking.available?(home, night)).to eq true
    end
    
    it 'can see if a booking with a home and a date is available return false' do
      home_name = 'Waterloo 25'
      available_night = '2022-05-16'
      unavailable_night = '2022-05-17'
      #create a user using the user class (already written)
      user = User.create(username: 'test_name', password: '12345678', email: 'test@email.com')
      #connect to the test table
      connection = PG.connect(dbname: "makersbnb_test")
      #put some data into the homes table 
      home = connection.exec("INSERT INTO homes (home_name, description, price, user_id) VALUES($1, $2, $3, $4) RETURNING id, home_name;", 
      ["#{home_name}", 'This is the description', 500, 1])
      #insert some data into the available table
      connection.exec("INSERT INTO available (home_id, night) VALUES($1, $2);", ["#{home[0]['id']}", available_night])
      expect(Booking.available?(home, unavailable_night)).to eq false
    end
  end

  describe '.approved' do
    it 'creates a booking, removing from available database and adding to bookings database' do
      home_name = 'Waterloo 25'
      night = '2022-05-16'
      #create a user using the user class (already written)
      user = User.create(username: 'test_name', password: '12345678', email: 'test@email.com')
      #connect to the test table
      connection = PG.connect(dbname: "makersbnb_test")
      #put some data into the homes table 
      home = connection.exec("INSERT INTO homes (home_name, description, price, user_id) VALUES($1, $2, $3, $4) RETURNING id, home_name;", 
      ["#{home_name}", 'This is the description', 500, 1])
      #insert some data into the available table
      connection.exec("INSERT INTO available (home_id, night) VALUES($1, $2);", ["#{home[0]['id']}", night])
      expect(Booking.available?(home, night)).to eq true
      Booking.approved(user, home, night)
      expect(Booking.check(user, home, night)).to eq true
      expect(Booking.available?(home, night)).to eq false
    end
  end
end
