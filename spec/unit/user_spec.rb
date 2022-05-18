require 'user'
require 'pg'
require 'pg_help'

describe User do
  it 'create a new user' do
    user = User.create(username: 'test_name', password: '12345678', email: 'test@email.com')

    persisted_data = persisted_data(table: 'users', id: user.id)

    expect(user).to be_a User
    expect(user.id).to eq persisted_data.first['id']
    expect(user.username).to eq 'test_name'
  end

  describe '.find' do
    it 'finds a user by id' do
      user = User.create(username: 'test_name', password: '12345678', email: 'test@email.com')
   
      result = User.find(id: user.id)
  
      expect(result.id).to eq user.id
      expect(result.username).to eq user.username
    end

    it 'returns nil if there is no id given' do
      expect(User.find(id: nil)).to eq nil
    end
  end
end
