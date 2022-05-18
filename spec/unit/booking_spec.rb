require 'booking'
require 'pg'

describe Booking do
  describe '.make' do
    xit 'returns true to a booking query' do
      expect(subject.make(true)).to eq true
    end
    xit 'can make a booking with a user' do
      user = User.create(username: 'test_name', password: '12345678', email: 'test@email.com')
      expect(subject.make(user)).to eq user
    end
    it 'can make a booking with a user and a home and a date' do
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
  end

end
