class Booking

  def make(user, home, night)
    p user
    p home[0]['home_name']
    # p night
    night = '2022-06-19'
    connection = PG.connect(dbname: "makersbnb_test")

    available = connection.exec("SELECT * FROM available WHERE home_id = #{home[0]['id']} AND night = '#{night}';")
    available[0]
    # !available.include? ("home_id") ? true : false
  end

end