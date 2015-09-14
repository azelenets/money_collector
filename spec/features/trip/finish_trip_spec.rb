feature 'Finish trip' do
  context 'by logged in user' do
    before do
      login_as FactoryGirl.create(:user)
      visit(trip_path(FactoryGirl.create(:trip)))
    end

    scenario 'successfully', js: true do
      click_button 'Finish'
      expect(page).to have_content('Trip successfully finished.')
    end
  end

  context 'by anonymous user' do
    before do
      visit(trip_path(FactoryGirl.create(:trip)))
    end

    scenario 'Create trip button not exists', js: true do
      expect(page).not_to have_link('Create trip')
    end
  end
end
