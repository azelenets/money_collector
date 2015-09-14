feature 'Visit country' do
  context 'by logged in user' do
    before do
      login_as FactoryGirl.create(:user)
      @currency = FactoryGirl.create(:currency, :with_countries)
      visit(currency_path(@currency))
    end

    scenario 'successfully', js: true do
      find('.visit-country').click
      expect(page).to have_content('Visited')
      expect(Currency.collected.first.name).to eq(@currency.name)
    end
  end

  context 'by anonymous user' do
    before do
      visit(currency_path(FactoryGirl.create(:currency, :with_countries)))
    end

    scenario 'raise alert with Unauthorized access', js: true do
      find('.visit-country').click
      alert_text = page.driver.browser.switch_to.alert.text
      puts page.driver.browser.switch_to.alert.accept
      expect(alert_text).to eq('You need to sign in or sign up before continuing.')
    end
  end
end
