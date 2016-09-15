# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rspec'
require 'capybara-screenshot/rspec'
require 'factory_girl'
require 'database_cleaner'

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!



RSpec.configure do |config|

  ActiveRecord::Base.logger.level = Logger::INFO
  ActionController::Base.logger.level = Logger::ERROR
  Rails.logger.level = Logger::ERROR
  
  # colors in terminal
  config.failure_color = :red #:magenta
  config.tty = true
  config.color = true

  config.infer_spec_type_from_file_location!
  config.include FactoryGirl::Syntax::Methods

  config.render_views
  
  config.include Capybara::DSL
  
  Capybara.javascript_driver = :webkit
  # # Capybara.default_wait_time = 2000
  # config.include Angular::DSL
  
  # Capybara::Screenshot.webkit_options = { width: 1280, height: 1000 }
  # # Keep only the screenshots generated from the last failing test suite
  Capybara::Screenshot.prune_strategy = :keep_last_run

  # config.use_transactional_fixtures = true

  # @source http://devblog.avdi.org/2012/08/31/configuring-database_cleaner-with-rails-rspec-capybara-and-selenium/
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end
  #
  config.before(:each) do
    DatabaseCleaner.start
  end

  # config.after :each do
  #   ActiveRecord::Base.subclasses.each(&:delete_all)
  #   ActiveRecord::Base.subclasses.each(&:reset_pk_sequence)
  # end

  config.after(:each) do
    DatabaseCleaner.clean
    DatabaseCleaner.strategy = :deletion
  end

  # Filtes needed tests(add :focus to run them, add :disable to disable them)
  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  config.filter_run_excluding disabled: true
end