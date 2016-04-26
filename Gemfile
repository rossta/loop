source "https://rubygems.org"

ruby "2.3.0"

gem "rails", "4.2.6"

gem "pg", "~> 0.15"

gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "jquery-rails"
gem "browserify-rails"
gem "turbolinks"

gem "active_model_serializers", "~> 0.10.0.rc1"

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem "therubyracer", platforms: :ruby

gem "sdoc", "~> 0.4.0", group: :doc

# Use ActiveModel has_secure_password
# gem "bcrypt", "~> 3.1.7"

gem "puma"

gem "redis"
gem "dalli"

gem "warden"
gem "pundit"
gem "virtus"
gem "rack-protection"
gem "simple_form"

gem "title"
gem "flutie"
gem "high_voltage"
gem "i18n-tasks"

gem "seed-fu"

gem "twitter"

gem "sinatra", require: false
gem "sidekiq"
# gem "sidetiq"
gem "ice_cube"

gem "omniauth-twitter"

gem "email_validator"
gem "recipient_interceptor"

gem "serviceworker-rails", github: "rossta/serviceworker-rails", branch: "master"

group :development, :test do
  gem "factory_girl_rails"
  gem "faker"
  gem "pry-rails"
  gem "pry-rescue"
  gem "pry-byebug"
  gem "awesome_print"
  gem "dotenv-rails"
  gem "spring"
end

group :development do
  gem "annotate"
  gem "better_errors"
  gem "guard-bundler"
  gem "guard-rails"
  gem "rails_layout"
  gem "web-console", "~> 2.0"
  gem "quiet_assets"
  gem "rb-fchange", require: false
  gem "rb-fsevent", require: false
  gem "rb-inotify", require: false
  gem "rubocop", require: false
  gem "ruby-lint", require: false
  gem "scss_lint", require: false
end

group :test do
  gem "shoulda-matchers"
  gem "database_cleaner"
  gem "launchy"
  gem "poltergeist"
  gem "formulaic"
  gem "timecop"
  gem "webmock"
  gem "vcr"
  gem "rspec-rails"
  gem "capybara"
  gem "guard-rspec"
end

gem "newrelic_rpm", ">= 3.7.3"
