require 'capybara/rails'
require 'capybara/rspec'
require 'capybara-screenshot/rspec'

RSpec.configure do
  Capybara.server do |app, port|
    require 'rack/handler/thin'
    Rack::Handler::Thin.run(app, Port: port)
  end

  Capybara.configure do |config|
    config.default_driver = :webkit
    config.javascript_driver = :webkit # :selenium
    # config.default_wait_time = 5
    config.run_server = true
    config.server_port = Rails.configuration.server_port
    config.app_host = "http://#{ Rails.configuration.server_host }"
    config.always_include_port = true
    # config.ignore_hidden_elements = false
    config.match = :prefer_exact
  end
end