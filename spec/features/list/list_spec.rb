feature 'List home' do
  scenario 'An owner can add a home to the list of homes' do
    visit('/signup')

    fill_in :username, with: 'test_name'
    fill_in :password, with: '12345678'
    fill_in :email, with: 'test@email.com'
    click_link 'SIGN UP'
    visit('/login')

    fill_in :username, with: 'test_name'
    fill_in :password, with: '12345678'
    click_link "LOG IN"
    visit('/selection')

    click_link 'LIST A HOME'
    visit('/list')

    expect(page).to have_content 'Add to the list of homes'
    fill_in :name, with: "Name"
    fill_in :description, with: "A lovely apartment"
    fill_in :price, with: "30"
    fill_in :night, with: "2022/05/18"
    click_button "SUBMIT"
    expect(current_path).to eq '/selection' 
  end
end


