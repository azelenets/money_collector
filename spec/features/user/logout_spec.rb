feature 'User logout' do
  before do
    login_as FactoryGirl.create(:user)
    visit(root_path)
  end

  scenario 'successfully', js: true do
    click_link('Logout')
    expect(page).to have_content('Signed out successfully.')
  end
end
