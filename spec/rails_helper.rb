# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

# Prevent database truncation if the environment is production:
abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'rspec/rails'

# Add additional requires below this line. Rails is not loaded until this point!
require 'capybara/poltergeist'
require 'factory_bot'
require 'capybara/rspec'

Capybara.javascript_driver = :poltergeist
Capybara.server = :puma

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|

  config.include FactoryBot::Syntax::Methods
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Devise::Test::ControllerHelpers, type: :view
  config.include Devise::Test::IntegrationHelpers, type: :feature

  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  # FCC config code:
  config.before(:suite) { DatabaseCleaner.clean_with(:truncation); }
  config.before(:each) { DatabaseCleaner.strategy = :transaction }
  config.before(:each, js: true) { DatabaseCleaner.strategy = :truncation; }
  config.before(:each) { DatabaseCleaner.start }

  config.after(:each) { DatabaseCleaner.clean }

end
