require 'pg'

class User
  attr_reader :id, :username
  
  def initialize(id:, username:)
    @id = id
    @username = username
  end

  def self.create(username:, password:, email:)
    connection = pg_connection
    user = connection.exec("INSERT INTO users (username, password, email) VALUES($1, $2, $3) RETURNING id, username;", 
      [username, password, email])

    User.new(id: user[0]['id'], username: user[0]['username'])
  end
    
  def self.find(id:)
    return nil unless id
    connection = pg_connection
    user = connection.exec("SELECT * FROM users WHERE id = $1", [id])

    User.new(id: user[0]['id'], username: user[0]['username'])
  end
  
  def self.login_find(username:, password:)
    connection = pg_connection
    user = connection.exec(
      "SELECT * FROM users WHERE username = $1 AND password = $2",
      [username, password]
    )

    User.new(id: user[0]['id'], username: user[0]['username'])
  end

  def self.pg_connection
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: "makersbnb_test")
    else
      connection = PG.connect("postgres://localhost:5432/makersbnb")
    end
  end
end
