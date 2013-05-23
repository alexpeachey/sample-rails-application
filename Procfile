# Define all of your processes here
# You can even start up various databases you need
# You should specify your databases first

# Redis for Sidekiq
redis: redis-server ./redis.conf

# Define your web process
web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb

# Foreman can run guard for us too
guard: bundle exec guard
