feature 'setting up the page' do
  scenario 'checking behavior' do
    visit('/selection')
    expect(page).to have_content "HOMES"
    expect(page).to have_content "LIST A HOME"
    expect(page).to have_content "PROFILE"
    expect(page).to have_content "SIGN OUT"
    expect(page).to have_content "RENT HOME"
    expect(page).to have_content "LIST HOME"
  end
end