feature "Sign up" do
  scenario 'checking behavior' do
    visit('/signup')

    expect(page).to have_button "SIGN UP"
  end

  scenario 'user can sign up' do
    visit('/signup')

    fill_in :username, with: 'test_name'
    fill_in :password, with: '12345678'
    fill_in :email, with: 'test@email.com'
    
    expect(page).to have_button 'SIGN UP'
    click_button 'SIGN UP'
    expect(page).to have_current_path('/selection')
  end
end