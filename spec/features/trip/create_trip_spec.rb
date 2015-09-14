feature 'Create trip' do
  context 'by logged in user' do
    before do
      FactoryGirl.create_list(:country, rand(1..3), :with_currencies)
      login_as FactoryGirl.create(:user)
      visit(trips_path)
      click_link 'Create trip'
    end

    scenario 'with valid inputs', js: true do
      fill_in 'trip[end_date]', with: DateTime.now + 1.day
      fill_in 'trip[description]', with: Faker::Lorem.sentence
      check Country.first.name

      click_button('Submit')
      expect(page).to have_content('Trip successfully created.')
    end

    scenario 'with invalid inputs', js: true do
      fill_in 'trip[end_date]', with: DateTime.now + 1.day
      fill_in 'trip[description]', with: ''

      click_button('Submit')
      expect(page).to have_content("Description can't be blank")
      expect(page).to have_content("Please select at least one country")
    end
  end

  context 'by anonymous user' do
    before do
      visit(trips_path)
    end

    scenario 'Create trip button not exists', js: true do
      expect(page).not_to have_link('Create trip')
    end
  end
end
