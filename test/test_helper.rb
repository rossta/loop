ENV["RAILS_ENV"] = "test"

ENV["REDIS_URL"] = ENV["REDIS_TEST_URL"]

require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"

# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
require "minitest/rails/capybara"

# awesome colorful output
require "minitest/pride"

# Stubbing HTTP requests
require "webmock/minitest"

Dir[Rails.root.join("test/support/**/*.rb")].each { |f| require f }

class Minitest::Spec
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  # fixtures :all
  # Add more helper methods to be used by all tests here...
end
