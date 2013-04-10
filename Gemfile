source 'https://rubygems.org'

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

end
