feature 'Homes overview' do
  xscenario 'A user can view all available homes' do
    visit ('/homes')
    expect(page).to have_content "Book your next stay"
  end
end