# Set your worker_processes to a reasonable number for your environment
# 3 works well on Heroku and is fine for development
# Memory is typically the limiting factor so on large memory servers you can bump this up.
worker_processes 3
timeout 30
preload_app true

before_fork do |server, worker|
  # Disconnect from db before forking
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.connection.disconnect!
    Rails.logger.info('Disconnected from ActiveRecord')
  end

  sleep 1
end

after_fork do |server, worker|
  # Connect to db after forking
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.establish_connection
    Rails.logger.info('Connected to ActiveRecord')
  end
end