require 'booking'
require 'pg'

describe Booking do
  describe '.make' do
    it 'can make a booking with a user and a home and a date and return true' do
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
      expect(subject.make(user, home, night)).to eq true
    end
    
    it 'can make a booking with a user and a home and a date and return false' do
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
      expect(subject.make(user, home, unavailable_night)).to eq false
    end
  end
end
git add .
