describe 'GET /trips(.:format)' do
  it { expect(get: trips_path).to route_to(controller: 'trips', action: 'index') }
end

describe 'POST /trips(.:format)' do
  it { expect(post: trips_path, trip: FactoryGirl.attributes_for(:trip)).to route_to(controller: 'trips', action: 'create') }
end

describe 'GET /trips/new(.:format)' do
  it { expect(get: new_trip_path).to route_to(controller: 'trips', action: 'new') }
end

describe 'GET /trips/:id/edit(.:format)' do
  it { expect(get: edit_trip_path(1)).to route_to(controller: 'trips', action: 'edit', id: '1') }
end

describe 'PUT /trips/:id/finish(.:format)' do
  it { expect(put: finish_trip_path(1)).to route_to(controller: 'trips', action: 'finish', id: '1') }
end

describe 'GET /trips/:id(.:format)' do
  it { expect(get: trip_path(1)).to route_to(controller: 'trips', action: 'show', id: '1') }
end

describe 'PATCH /trips/:id(.:format)' do
  it { expect(patch: trip_path(1)).to route_to(controller: 'trips', action: 'update', id: '1') }
end

describe 'PUT /trips/:id(.:format)' do
  it { expect(put: trip_path(1)).to route_to(controller: 'trips', action: 'update', id: '1') }
end

describe 'DELETE /trips/:id(.:format)' do
  it { expect(delete: trip_path(1)).to route_to(controller: 'trips', action: 'destroy', id: '1') }
end
