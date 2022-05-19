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

  def self.approved(renter, home, night)
    connection = PG.connect(dbname: "makersbnb_test")
    # should also check if in the requests table and raise error if not
    raise 'home not available' unless self.available?(home, night)
    connection.exec("INSERT INTO bookings (renter_id, home_id, night) VALUES($1, $2, $3);", ["#{renter.id}", "#{home[0]['id']}", night])
    connection.exec("DELETE FROM available WHERE home_id = #{home[0]['id']}")
  end
  
  def self.check(home, night)
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

  def self.request(renter, home, night)
    connection = PG.connect(dbname: "makersbnb_test")
    # should also check if in the requests table and raise error if not
    connection.exec("INSERT INTO requests (renter_id, home_id, night) VALUES($1, $2, $3);", ["#{renter.id}", "#{home[0]['id']}", night])
  end

  def self.owner_requests(owner)
    #the idea behind this was that we would return the requests that an owner has
    #against their user id, and also the same would be true for a renter
  end

end
