source 'https://rubygems.org'

gem 'rails', '3.2.9'


#gem 'websocket-rails', '0.2.1'
#gem 'therubyracer' not in Jruby -pirtlj

group :worker do
  gem 'activerecord-jdbcpostgresql-adapter'
  gem 'jruby-openssl'
end

group :development, :test, :production do
  gem "pg"
  gem 'thin'
  #Client 
  gem 'jquery-rails'
  gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
  gem "haml-rails"
  
  # Using 2.1.0 from rubygems.org somehow doesn't work with jRuby, so fetch in from GitHub
  gem 'twitter-bootstrap-rails', :github => 'seyhunak/twitter-bootstrap-rails'
end

gem "rails-backbone"
gem "marionette-rails"

#Worker
gem 'sidekiq'


#Authentication
gem 'devise'

#Misc
gem "rack", "1.4.1"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem "therubyracer"
  #gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end


group :development, :test do
  gem 'rspec-rails'
  gem 'watchr'
  gem 'spork', '~> 0.9.0.rc'

  # Deploy with Capistrano
  gem 'capistrano'
  gem 'rvm-capistrano'
  gem 'capistrano-ext'
  # To use debugger
  # gem 'debugger'
end
