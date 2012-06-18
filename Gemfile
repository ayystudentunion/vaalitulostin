source 'http://rubygems.org'

gem 'rails', '3.0.15'       # deprecation warnings for Rails 3.1
gem 'delayed_job', '~> 2.1' # incompatible with 3.x
gem 'formtastic', '~> 2.1'  # deprecation warnings (needed by active admin)

gem 'activeadmin'
gem 'ranked-model'
gem 'draper'
gem 'cancan'
gem 'passgen'

gem "aws-s3", :require => "aws/s3"

gem 'pg'
gem 'hoptoad_notifier'
gem 'newrelic_rpm'
gem 'jquery-rails'
gem 'sass'

gem 'redis'

gem 'state_machine'
gem 'sendgrid' # required because Mailers use sendgrid gem's methods
gem 'foreigner'

group :development do
  gem 'heroku'
end

group :development, :test do
  gem 'database_cleaner'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'cover_me'
  gem 'factory_girl_rails'
  gem 'guard-rspec'
  gem 'growl'
  gem 'taps'
  gem 'ruby-debug19'
end

group :test do
  gem 'cucumber'
  gem 'cucumber-rails'
  gem 'capybara'
  gem 'spork'
end