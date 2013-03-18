Sidekiq.configure_server do |config|
  config.poll_interval = 0.001
end