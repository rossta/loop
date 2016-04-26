Warden.test_mode!

RSpec.configure do |config|
  config.include Warden::Test::Helpers
  config.before(:each, type: :feature) do
    Warden.test_reset!
  end
end
