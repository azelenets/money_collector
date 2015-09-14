feature 'Show info about countries' do
  before do
    FactoryGirl.create(:currency, :with_countries)
    visit(root_path)
  end

  scenario 'number of available in', js: true do
    click_link('Currencies')
    click_link('Available')
    expect(page).to have_content("Available in #{Currency.includes(:countries).first.countries.count} country")
  end

  scenario 'number of to be visited', js: true do
    click_link('Currencies')
    click_link('Available')
    expect(page).to have_content("#{Currency.includes(:countries).first.countries.count} country waiting for your visit")
  end
end
