feature "Log in" do
  scenario 'checking behavior' do
    visit('/login')

    expect(page).to have_link "LOG IN"
  end

  scenario 'user can log in' do
    signup

    visit('/login')
    fill_in :username, with: 'test_name'
    fill_in :password, with: '12345678'
    click_link "LOG IN"
    expect(page).to have_current_path('/selection')
  end
end