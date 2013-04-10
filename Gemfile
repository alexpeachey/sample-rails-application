source 'https://rubygems.org'

# If using rvm you can specify ruby and gemset in comments
#ruby=2.0.0
#ruby-gemset=sample

# Bundler lets you specify which ruby to use.
# It is a good idea to put what ruby should be used for your app here.
ruby '2.0.0'

# You should always have your rails gem set explicitly to a version.
# This ensures you do not accidentaly update it.
gem 'rails', '3.2.13'

gem 'jquery-rails'

# Unless you have a good reason to use an alternative datastore,
# PostgreSQL is highly recommended and should be your default.
gem 'pg'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # It is often best to install node.js on your local system.
  # If you need to compile your assets in production consider installing node.js there as well.
  # If you can't use node.js for whatever reason, go ahead and use therubyracer
  # You do not need to specify a runtime for deployment to Heroku
  # gem 'therubyracer', platforms: :ruby
end

# There are few gems that you only need in development and not test and vice versa.
# You should put most everything in a combined group
group :development, :test do
  # Originate practices TDD/BDD and the prefered framework is rspec
  # Once bundled use 'rails g rspec:install' to perform initial setup
  gem "rspec-rails", "~> 2.4"
  
  # For integration/feature tests the prefered tool is capybara
  gem "capybara"
  # Capybara uses rack-test by default unless a test is flagged :js
  # For :js tests selenium is used unless another driver is installed
  # You may wish to use webkit and specify 'Capybara.javascript_driver = :webkit'
  # gem "capybara-webkit"

  # Cucumber is often the right choices for some partners.
  # gem "cucumber"

  # Factories are prefered over fixtures
  gem 'factory_girl_rails'
  # And we need to clean up our mess when using factories
  gem 'database_cleaner'

  # Stay on top of your test coverage with simplecov.
  gem 'simplecov', require: false
  # Pretty reports using html
  gem 'simplecov-html', require: false
  # For compatibility with some CI environments use the rcov formater
  gem 'simplecov-rcov', require: false

  # We can make our tests faster with spork
  # For rspec 'spork rspec --bootstrap'
  # For cucumber 'spork cucumber --bootstrap'
  gem 'spork-rails'

  # We can use guard to watch changes in the filesystem and act on them
  gem 'guard'
  gem 'rb-inotify', require: false
  gem 'rb-fsevent', require: false
  gem 'rb-fchange', require: false
  # We can get nifty notifications like via Growl
  gem 'ruby_gntp'
  # There are several useful plugins for Guard
  # rspec integration
  gem 'guard-rspec'
  # spork integration
  gem 'guard-spork'
  # live reload integration (you need a live reload browser plugin)
  gem 'guard-livereload'
  # Automatically annotate your models
  gem 'guard-annotate'
  
end
