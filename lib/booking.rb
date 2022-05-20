class Booking

  def self.available?(home, night)

    connection = pg_connection    
    available = connection.exec("SELECT CASE WHEN EXISTS 
    (
    SELECT * FROM available WHERE home_id = #{home[0]['id']} AND night = '#{night}')
    THEN 'TRUE'
    ELSE 'FALSE'
    END;")

    available[0]['case'] == "TRUE" ? true : false
  end

  def self.approved(renter, home, night)
    connection = pg_connection
        # shconnectould also check if in the requests table and raise error if not
    raise 'home not available' unless self.available?(home, night)
    connection.exec("INSERT INTO bookings (renter_id, home_id, night) VALUES($1, $2, $3);", ["#{renter.id}", "#{home[0]['id']}", night])
    connection.exec("DELETE FROM available WHERE home_id = #{home[0]['id']}")
    connection.exec("DELETE FROM requests WHERE home_id = #{home[0]['id']}")
  end
  
  def self.check(home, night)
    # this tells you if something is in the bookings table
    connection = pg_connection    
    available = connection.exec("SELECT CASE WHEN EXISTS 
    (
    SELECT * FROM bookings WHERE home_id = #{home[0]['id']} AND night = '#{night}')
    THEN 'TRUE'
    ELSE 'FALSE'
    END;")

    available[0]['case'] == "TRUE" ? true : false
  end

  def self.request(renter, home_id, night)
    connection = pg_connection      # should also check if in the requests table and raise error if not
    connection.exec("INSERT INTO requests (renter_id, home_id, night) VALUES($1, $2, $3);", ["#{renter.id}", "#{home_id}", night])
  end

  def self.request_check?(home, night)
    #the idea behind this was that we would return the requests that an owner has
    #against their user id, and also the same would be true for a renter
    connection = pg_connection    
    available = connection.exec("SELECT CASE WHEN EXISTS 
    (
    SELECT * FROM requests WHERE home_id = #{home[0]['id']} AND night = '#{night}')
    THEN 'TRUE'
    ELSE 'FALSE'
    END;")
    available[0]['case'] == "TRUE" ? true : false
  end

  def self.request_all
    connection = pg_connection
    result = connection.exec("SELECT * FROM requests")
    connection.close
    return result
  end

  def self.pg_connection
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: "makersbnb_test")
    else
      connection = PG.connect("postgres://localhost:5432/makersbnb")
    end
  end

end
