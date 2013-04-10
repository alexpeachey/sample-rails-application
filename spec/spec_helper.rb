require 'rubygems'
require 'spork'
#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However,
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.
  unless ENV['DRB']
    # Setup our coverage reporting first before anything else is loaded
    require 'simplecov'
    require 'simplecov-html'
    require 'simplecov-rcov'
    SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
      SimpleCov::Formatter::HTMLFormatter,
      SimpleCov::Formatter::RcovFormatter,
    ]
    SimpleCov.start 'rails'
  end
  require "rails/application"
  Spork.trap_method(Rails::Application, :reload_routes!)
  Spork.trap_method(Rails::Application, :eager_load!)
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  Rails.application.railties.all { |r| r.eager_load! }
  require 'rspec/rails'
  require 'rspec/autorun'
  require 'capybara/rspec'
  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
  # Require Factory Girl and load factories
  require 'factory_girl'
  FactoryGirl.find_definitions
  # Require our Database Cleaner to clean up after ourselves
  require 'database_cleaner'
  DatabaseCleaner.strategy = :truncation
  RSpec.configure do |config|
    # ## Mock Framework
    #
    # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
    #
    # config.mock_with :mocha
    # config.mock_with :flexmock
    # config.mock_with :rr

    # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
    # We are not using fixtures so comment this out
    # config.fixture_path = "#{::Rails.root}/spec/fixtures"

    # If you're not using ActiveRecord, or you'd prefer not to run each of your
    # examples within a transaction, remove the following line or assign false
    # instead of true.
    # We are not using fixtures so comment this out
    # config.use_transactional_fixtures = true

    # If true, the base class of anonymous controllers will be inferred
    # automatically. This will be the default behavior in future versions of
    # rspec-rails.
    config.infer_base_class_for_anonymous_controllers = false

    # Allow us to use simple filters like :focus
    config.treat_symbols_as_metadata_keys_with_true_values = true
    # If everything is filtered out we'll run everything
    config.run_all_when_everything_filtered = true
    # We'll use :focus to specify which tests to run
    config.filter_run :focus
    # Optionally use a tag to filter out tests
    # config.filter_run_excluding :slow

    # Factory Girl setup
    config.include FactoryGirl::Syntax::Methods

    # Since we are using factories we must clean up
    config.after(:each) do
      DatabaseCleaner.clean
    end

    # Run specs in random order to surface order dependencies. If you find an
    # order dependency and want to debug it, you can fix the order by providing
    # the seed, which is printed after each run.
    #     --seed 1234
    config.order = "random"
  end
end

Spork.each_run do
  # This code will be run each time you run your specs.
  if ENV['DRB']
    # Setup our coverage reporting first before anything else is loaded
    require 'simplecov'
    require 'simplecov-html'
    require 'simplecov-rcov'
    SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
      SimpleCov::Formatter::HTMLFormatter,
      SimpleCov::Formatter::RcovFormatter,
    ]
    SimpleCov.start 'rails'
  end

  # We want to reload Factory Girl each run
  FactoryGirl.reload
end








