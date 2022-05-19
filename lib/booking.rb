class Booking

  def self.available?(home, night)

    connection = PG.connect(dbname: "makersbnb_test")
    
    available = connection.exec("SELECT CASE WHEN EXISTS 
    (
    SELECT * FROM available WHERE home_id = #{home[0]['id']} AND night = '#{night}')
    THEN 'TRUE'
    ELSE 'FALSE'
    END;")

    available[0]['case'] == "TRUE" ? true : false
  end

  def self.approved(user, home, night)
    connection = PG.connect(dbname: "makersbnb_test")
    connection.exec("INSERT INTO bookings (user_id, home_id, night) VALUES($1, $2, $3);", ["#{user.id}", "#{home[0]['id']}", night])
    connection.exec("DELETE FROM available WHERE home_id = #{home[0]['id']}")
  end
  
  def self.check(user, home, night)
    # this tells you if something is in the bookings table
    connection = PG.connect(dbname: "makersbnb_test")
    
    available = connection.exec("SELECT CASE WHEN EXISTS 
    (
    SELECT * FROM bookings WHERE home_id = #{home[0]['id']} AND night = '#{night}')
    THEN 'TRUE'
    ELSE 'FALSE'
    END;")

    available[0]['case'] == "TRUE" ? true : false
  end
end
