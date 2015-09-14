feature 'Edit trip' do
  context 'by logged in user' do
    before do
      login_as FactoryGirl.create(:user)
      visit(trip_path(FactoryGirl.create(:trip)))
    end

    scenario 'successfully', js: true do
      click_button 'Edit'
      fill_in 'trip[end_date]', with: DateTime.now + 3.day
      fill_in 'trip[description]', with: Faker::Lorem.sentence
      click_button 'Submit'

      expect(page).to have_content('Trip successfully updated.')
    end
  end

  context 'by anonymous user' do
    before do
      visit(trip_path(FactoryGirl.create(:trip)))
    end

    scenario 'Edit trip button not exists', js: true do
      expect(page).not_to have_link('Edit')
    end
  end
end
