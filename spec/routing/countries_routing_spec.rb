describe 'GET /countries(.:format) ' do
  it { expect(get: countries_path).to route_to(controller: 'countries', action: 'index') }
end

describe 'GET /countries/:id(.:format) ' do
  it { expect(get: country_path(1)).to route_to(controller: 'countries', action: 'show', id: '1') }
end

describe 'PUT /countries/:id/visit(.:format)' do
  it { expect(put: visit_country_path(1)).to route_to(controller: 'countries', action: 'visit', id: '1') }
end
