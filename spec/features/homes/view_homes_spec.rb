feature 'Homes overview' do
  scenario 'A user can view all available homes' do
    visit ('/homes')
    expect(page).to have_content "Book your next stay"
  end
end