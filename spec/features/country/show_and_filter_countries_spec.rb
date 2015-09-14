feature 'Show and filter countries' do
  before do
    @visited_country = FactoryGirl.create(:country, visited: true)
    @not_visited_country = FactoryGirl.create(:country, :with_currencies)
    visit(root_path)
  end

  scenario 'by available (all)', js: true do
    click_link('Countries')
    click_link('Available')
    expect(page).to have_content(@visited_country.name)
    expect(page).to have_content(@not_visited_country.name)
  end

  scenario 'by not visited', js: true do
    click_link('Countries')
    click_link('Not visited')
    expect(page).not_to have_content(@visited_country.name)
    expect(page).to have_content(@not_visited_country.name)
  end

  scenario 'by visited', js: true do
    click_link('Countries')
    click_link('Visited')
    expect(page).to have_content(@visited_country.name)
  end
end
