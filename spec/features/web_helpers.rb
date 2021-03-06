def signup
  visit('/signup')
  fill_in :username, with: 'test_name'
  fill_in :password, with: '12345678'
  fill_in :email, with: 'test@email.com'
  click_link 'SIGN UP'
end

def login
  visit('/login')
  fill_in :username, with: 'test_name'
  fill_in :password, with: '12345678'
  click_link "LOG IN"
end

def selection_list
  visit('/selection')
  click_link 'LIST A HOME'
end

def selection_homes
  visit('/selection')
  click_link 'HOMES'
end

def request
  visit('/request')
  click_link "REQUEST TO BOOK"
end

def list_home
  fill_in :home_name, with: "Name"
  fill_in :description, with: "A lovely apartment"
  fill_in :price, with: "30"
  fill_in :night, with: "2022/05/18"
  click_link "SUBMIT"
end