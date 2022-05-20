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
      connection = PG.connect(dbname: 'makersbnb_test')
      connection.exec("INSERT INTO users (id, username, password, email) VALUES ('45', 'Slava', 'testpassword1', 'test@email.com');")
      Home.create(home_name: 'Paradise house', description: 'Description is here', price: '500', owner_id: '45')
      
      home = Home.all[0]

      expect(home['home_name']).to eq 'Paradise house'
      expect(home['description']).to eq 'Description is here'
      expect(home['price']).to eq '500'
      expect(home['owner_id']).to eq '45'
    end
  end

end