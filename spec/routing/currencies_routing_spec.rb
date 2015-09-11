describe '/currencies(.:format) ' do
  it { expect(get: currencies_path).to route_to(controller: 'currencies', action: 'index') }
end

describe '/currencies/:id(.:format) ' do
  it { expect(get: currency_path(1)).to route_to(controller: 'currencies', action: 'show', id: '1') }
end
