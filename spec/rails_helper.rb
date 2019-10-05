# IMPORTANT ! #
# This allows simlecov to cover all specs. must be at the start
require 'simplecov'
SimpleCov.start do
  add_filter "app/controllers/application_controller.rb"
  # yes, maybe dodgy - whatevs
end

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?


require 'spec_helper'
require 'rspec/rails'
require 'capybara/rails'

# IMPORTANT ! #
# This allows capybara to perform the login_as action
include Warden::Test::Helpers
Warden.test_mode!
# IMPORTANT ! #

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  # IMPORTANT ! #
  # This allows RSpec to perform the sign_in action in the controller tests
  config.include Devise::Test::ControllerHelpers, type: :controller
  # IMPORTANT ! #

end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
