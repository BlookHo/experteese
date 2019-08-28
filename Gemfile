source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'

# Use sqlite3 as the database for Active Record
# gem 'sqlite3' # Comment or Remove this Gem

# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
gem 'activerecord-reset-pk-sequence'

gem 'wdm', '>= 0.1.0' if Gem.win_platform?

# Use Puma as the app server
gem 'puma', '~> 3.0'

gem 'haml-rails'
gem 'bootstrap-sass', '>= 3.4.1'

# Use ActiveModel has_secure_password
gem 'bcrypt', git: 'https://github.com/codahale/bcrypt-ruby.git', :require => 'bcrypt'
# # Image loading with remote
# gem 'remotipart', '~> 1.2'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Use jquery as the JavaScript library
gem 'jquery-ui-rails'
gem 'rails-asset-jqueryui'

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
gem 'active_model_serializers'

# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 3.0'  # 3.3.1

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Pagination
gem 'kaminari'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  # Better errors display
  gem "better_errors"
  gem "binding_of_caller"
  gem 'rspec-rails', '~> 3.5'
  gem 'rails-controller-testing', '0.1.1'
 # Automagically launches tests for changed files
  gem 'guard'
  gem 'guard-rspec', '~> 4.6', require: false
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console' # 3.3.1
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # Automatic Ruby code checking tool
  gem 'rubocop', require: false
  gem 'rubocop-rspec', '~> 1.32.0', require: false

  gem 'pronto', '~> 0.9.5'
  gem 'pronto-rubocop', '~> 0.9.0', require: false

  # Vulnarabilities check
  gem 'brakeman', '~> 3.3.3'
end

group :test do
  # For active record imitation in tests
  gem 'factory_girl_rails'

  # TODO: move all factories to FactoryBot
  # gem 'factory_bot_rails' #, '~> 4.8', '>= 4.8.2'

  # Faker, a port of Data::Faker from Perl,
  # is used to easily generate fake data: names, addresses, phone numbers, etc.
  gem 'faker', '~> 1.5'
  gem 'capybara'  #, '~> 2.4'
  gem 'capybara-ng'
  # Enables screenshots creation during tests
  gem 'capybara-screenshot'
  gem 'spring-commands-rspec'
  # Auto cleans test db after each test run
  gem 'database_cleaner'
  # automatic merging of coverage across test suites
  gem 'simplecov', :require => false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
# Icons fonts
gem 'font-awesome-sass' #, '~> 4.6.2'
gem 'font-awesome-rails', '~> 4.6', '>= 4.6.3.1'

# Memcached
# gem 'dalli'
# gem 'memcached' # before - check to be installed: $ sudo apt-get install libsasl2-dev
# Connect test to Memcached according http://blog.elijaa.org/2010/05/21/memcached-telnet-command-summary/
# gem 'actionpack-action_caching'

group :production do
  # For Heroku deployment
  gem 'rails_12factor'
end
