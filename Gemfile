source 'https://rubygems.org'

gem 'rails', '3.2.9'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'


#Database
gem "pg"

#Web Server
gem 'thin'
gem 'websocket-rails', '0.2.1'
gem 'therubyracer'

#Client 
gem 'jquery-rails'
gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
gem "haml-rails"
gem "twitter-bootstrap-rails"
gem "rails-backbone"
gem "marionette-rails"

#Worker
gem 'resque', :require => 'resque/server'

#Authentication
gem 'devise'

#Misc
gem "rack", "1.4.1"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  #gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end


group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'watchr'
  gem 'spork', '~> 0.9.0.rc'
  
  
  # Deploy with Capistrano
  gem 'capistrano'
  gem 'rvm-capistrano'
  # To use debugger
  # gem 'debugger'
end
