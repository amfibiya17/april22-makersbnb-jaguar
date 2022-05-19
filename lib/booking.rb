class Booking

  def self.check(home, night)

    connection = PG.connect(dbname: "makersbnb_test")
    
    available = connection.exec("SELECT CASE WHEN EXISTS 
    (
    SELECT * FROM available WHERE home_id = #{home[0]['id']} AND night = '#{night}')
    THEN 'TRUE'
    ELSE 'FALSE'
    END;")

    available[0]['case'] == "TRUE" ? true : false
  end
end
