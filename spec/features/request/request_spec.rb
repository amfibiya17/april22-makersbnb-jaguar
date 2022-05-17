feature 'Checkout page' do
  scenario 'checking behavior of checkout page' do
    # need to update test when sign up and log in page done
    visit('/request')
    expect(page).to have_content "HOMES"
    expect(page).to have_content "LIST A HOME"
    expect(page).to have_content "PROFILE"
    expect(page).to have_content "SIGN OUT"

    expect(page).to have_content "NAME OF HOME"
    expect(page).to have_content "Choose night"
    expect(page).to have_field type: "date"
    expect(page).to have_content "REQUEST TO BOOK"
  end

  # scenario 'choosing dates' do
  #   fill_in "date", with: "10/12/1986"
  #   click_button "REQUEST TO BOOK"
  # end
end