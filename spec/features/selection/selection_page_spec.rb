feature 'Selection page' do
  scenario 'checking behavior' do
    visit('/selection')
    expect(page).to have_content "HOMES"
    expect(page).to have_content "LIST A HOME"
    expect(page).to have_content "PROFILE"
    expect(page).to have_content "SIGN OUT"
    expect(page).to have_content "RENT HOME"
    expect(page).to have_content "LIST HOME"
  end

  scenario "user can go to homes page from selection page" do
    visit('/selection')
    click_link 'HOMES'
    expect(page).to have_current_path('/homes')
    # need to update test when sign up and log in page done
  end

  scenario "user can go to 'list a home' page from selection page" do
    visit('/selection')
    click_link 'LIST A HOME'
    expect(page).to have_current_path('/list')
    # need to update test when sign up and log in page done
  end

  scenario "user can go to profile page from selection page" do
    visit('/selection')
    click_link 'PROFILE'
    expect(page).to have_current_path('/profile')
    # need to update test when sign up and log in page done
  end

  scenario "user can sign out on selection page" do
    visit('/selection')
    click_link 'SIGN OUT'
    expect(page).to have_current_path('/login')
    # need to update test when sign up and log in page done
  end
end
