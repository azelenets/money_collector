feature 'Show and filter currencies' do
  before do
    @not_collected_currency = FactoryGirl.create(:currency, :with_countries)
    @collected_currency = FactoryGirl.create(:currency, :with_countries)
    @collected_currency.countries.map { |country| country.visit! }
    @collected_currency.collect!
    visit(root_path)
  end

  scenario 'by available (all)', js: true do
    click_link('Currencies')
    click_link('Available')
    expect(page).to have_content(@not_collected_currency.name)
    expect(page).to have_content(@collected_currency.name)
  end

  scenario 'by country not visited', js: true do
    click_link('Currencies')
    click_link('Country not visited')
    expect(page).not_to have_content(@collected_currency.name)
    expect(page).to have_content(@not_collected_currency.name)
  end

  scenario 'by collected', js: true do
    click_link('Currencies')
    click_link('Collected')
    expect(page).to have_content(@collected_currency.name)
  end

  scenario 'by not collected', js: true do
    click_link('Currencies')
    click_link('Not collected')
    expect(page).not_to have_content("#{ @collected_currency.name } [ #{ @collected_currency.code } ]")
    expect(page).to have_content("#{ @not_collected_currency.name } [ #{ @not_collected_currency.code } ]")
  end
end
