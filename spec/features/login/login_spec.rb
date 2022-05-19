feature "Log in" do
  scenario 'checking behavior' do
    visit('/login')

    expect(page).to have_button "LOG IN"
  end

  scenario 'user can log in' do
    visit('/signup')

    fill_in :username, with: 'test_name'
    fill_in :password, with: '12345678'
    fill_in :email, with: 'test@email.com'
    click_button 'SIGN UP'

    visit('/login')

    fill_in :username, with: 'test_name'
    fill_in :password, with: '12345678'
    click_link "LOG IN"

    expect(page).to have_current_path('/selection')
  end
end