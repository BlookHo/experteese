source 'https://rubygems.org'

ruby '2.3.1'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'

# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
gem 'activerecord-reset-pk-sequence'

# # Use sqlite3 as the database for Active Record
# gem 'sqlite3'

# Use Puma as the app server
gem 'puma', '~> 3.0'  # 3.6.0

gem 'haml-rails'  # 0.9.0 Installed

gem 'bootstrap-sass', '3.3.6' # Installed 3.3.6

# Use ActiveModel has_secure_password
gem 'bcrypt'

# # Image loading with remote
# gem 'remotipart', '~> 1.2'


# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

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
# gem 'will_paginate'
gem 'kaminari'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri

  # Лучше отображает ошибки
  gem "better_errors"
  gem "binding_of_caller"



  gem 'rspec-rails', '~> 3.5'  # 3.5.2 Installed
  gem 'rails-controller-testing', '0.1.1'
  # gem 'minitest-reporters',       '1.1.9'
  # gem "minitest"
  # gem 'minitest-spec-rails'


 # Automagically launches tests for changed files
  gem 'guard'
 gem 'guard-rspec', '~> 4.6', require: false
  # gem 'guard-minitest', require: false
  
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console' # 3.3.1
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  
  # For active record imitation in tests
  gem "factory_girl_rails"  # 4.7.0
  # installed 'factory_girl' # 3.5.0
  
  # Faker, a port of Data::Faker from Perl,
  # is used to easily generate fake data: names, addresses, phone numbers, etc.
  gem 'faker', '~> 1.5' # 1.6.6

  gem 'capybara'  #, '~> 2.4'
  gem 'capybara-ng'
  # Webkit driver for js feature tests
  # gem 'capybara-webkit'
  # Enables screenshots creation during tests
  gem 'capybara-screenshot'

  gem 'spring-commands-rspec'
  
  # Auto cleans test db after each test run
  gem 'database_cleaner'

  # automatic merging of coverage across test suites
  gem 'simplecov', :require => false #, :group => :test
  
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
