require 'home'
require 'pg'

describe Home do

  describe '.all' do
    it 'returns all homes' do
      connection = PG.connect(dbname: 'makersbnb_test')
      connection.exec("INSERT INTO users (id, username, password, email) VALUES ('45', 'Slava', 'testpassword1', 'test@email.com');")
      connection.exec("INSERT INTO homes (home_name, description, price, owner_id) VALUES ('Paradise house', 'Description is here', 500, 45);")
      
      home = Home.all[0]

      expect(home['home_name']).to eq 'Paradise house'
      expect(home['description']).to eq 'Description is here'
      expect(home['price']).to eq '500'
      expect(home['owner_id']).to eq '45'
    end
  end

  describe '.create' do
    it 'creates a new home' do
      night = '2022-05-16'
      connection = PG.connect(dbname: 'makersbnb_test')
      connection.exec("INSERT INTO users (id, username, password, email) VALUES ('45', 'Slava', 'testpassword1', 'test@email.com');")
      Home.create(home_name: 'Paradise house', description: 'Description is here', price: '500', owner_id: '45', night: night)
      
      home = Home.all[0]

      expect(home['home_name']).to eq 'Paradise house'
      expect(home['description']).to eq 'Description is here'
      expect(home['price']).to eq '500'
      expect(home['owner_id']).to eq '45'
      test = connection.exec("SELECT * FROM available")
      p test[0]
      available = connection.exec("SELECT CASE WHEN EXISTS 
        (
        SELECT * FROM available WHERE home_id = 1 AND night = '#{night}')
        THEN 'TRUE'
        ELSE 'FALSE'
        END;")
      expect(available[0]['case']).to eq "TRUE"
    end
  end

end