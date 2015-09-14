feature 'Show info about trip' do
  before do
    @trip = FactoryGirl.create(:trip)
    visit(trips_path)
  end

  scenario 'number of visited countries', js: true do
    expect(page).to have_content("#{ @trip.countries.visited.count }/#{ @trip.countries.count } #{ 'country'.pluralize(@trip.countries.visited.count) } visited")
  end

  scenario 'start date - end date', js: true do
    expect(page).to have_content("#{ @trip.created_at.strftime('%F') } - #{ @trip.end_date.strftime('%F') }")
  end

  scenario 'description', js: true do
    expect(page).to have_content(@trip.description)
  end
end
