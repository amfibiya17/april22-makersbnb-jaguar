feature "Log in" do
  scenario 'checking behavior' do
    visit('/login')

    expect(page).to have_button "LOG IN"
  end

  scenario 'user can log in' do
    visit('/login')

    fill_in :username, with: 'test_name'
    fill_in :password, with: '12345678'
    
    expect(page).to have_button "LOG IN"
    click_button "LOG IN"
    # expect(page).to have_current_path('/selection')
  end
end