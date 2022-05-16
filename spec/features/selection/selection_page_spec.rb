feature 'setting up the page' do
  scenario 'checking behaviour' do
    visit('/selection')
    expect(page).to have_link("Homes", href: '/homes')
    expect(page).to have_link("List", href: '/list')
    expect(page).to have_link("Profile", href: 'profile')
    expect(page).to have_link("Sign out", href: '/login')
    expect(page).to have_button("Rent", href: '/homes')
    expect(page).to have_button("List", href: '/list')
  end
end