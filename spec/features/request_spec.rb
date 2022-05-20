feature 'Request page' do
  scenario 'Choosing night' do
    signup
    login
    
    selection_homes
    list_home
    visit('/request?id=1')

    expect(page).to have_content "HOMES"
    expect(page).to have_content "LIST A HOME"
    expect(page).to have_content "PROFILE"
    expect(page).to have_content "SIGN OUT"

    expect(page).to have_content "NAME OF HOME"
    expect(page).to have_content "Choose night"
    expect(page).to have_field type: "date"
    expect(page).to have_content "REQUEST TO BOOK"

    fill_in "date", with: "2022/05/05"
    click_link "REQUEST TO BOOK"
    expect(page).to have_current_path('/profile')
  end
end