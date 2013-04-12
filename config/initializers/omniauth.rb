# This is a basic configuration for using OmniAuth
# Adding additional providers is as simple as including
# them in the block below.
Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :developer unless Rails.env.production?
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  # provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
  # provider :google_oauth2, ENV["GOOGLE_KEY"], ENV["GOOGLE_SECRET"]
  # provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
end

# We can tell OmniAuth to log using the Rails Logger instead of stdout
OmniAuth.config.logger = Rails.logger