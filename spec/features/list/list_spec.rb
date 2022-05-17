feature 'List home' do
  scenario 'An owner can add a home to the list of homes' do
    visit('/list')
    expect(page).to have_content 'Add to the list of homes'
    fill_in :name, with: "Name"
    fill_in :description, with: "A lovely apartment"
    fill_in :price, with: "30"
    fill_in :start_date, with: "2022/05/18"
    fill_in :end_date, with: "2022/05/21"
    click_button :Submit
    expect(current_path).to eq '/selection' 
  end
end


