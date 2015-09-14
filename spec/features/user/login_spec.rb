feature 'User login' do
  before do
    FactoryGirl.create(:user)
    visit(root_path)
    click_link('Login')
  end

  scenario 'with valid inputs', js: true do
    fill_in 'user[email]', with: User.first.email
    fill_in 'user[password]', with: 'password'

    click_button('Log in')
    expect(page).to have_content('Signed in successfully.')
  end

  scenario 'with invalid inputs', js: true do
    fill_in 'user[email]', with: 'invalid_user@test.com'
    fill_in 'user[password]', with: 'password'

    click_button('Log in')
    expect(page).to have_content('Invalid email or password.')
  end
end
