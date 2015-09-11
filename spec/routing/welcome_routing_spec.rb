describe 'root' do
  it { expect(get: root_path).to route_to(controller: 'welcome', action: 'index') }
end
