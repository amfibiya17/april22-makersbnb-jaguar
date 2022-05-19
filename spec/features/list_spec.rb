feature 'List home' do
  scenario 'An owner can add a home to the list of homes' do
    signup
    login
    selection_list

    visit('/list')

    expect(page).to have_content 'Add to the list of homes'
    fill_in :name, with: "Name"
    fill_in :description, with: "A lovely apartment"
    fill_in :price, with: "30"
    fill_in :night, with: "2022/05/18"
    click_link "SUBMIT"
    expect(current_path).to eq '/selection' 
  end
end


