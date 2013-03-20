set :deploy_to, "/var/www/metaworker"

role :app,  metaworker_1, :jobs => true           # This may be the same as your `Web` server
