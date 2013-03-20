set :deploy_to, "/var/www/sites/metacraft"

set :bundle_without, [:development, :test, :worker]

role :web,  metafront_1                       # Your HTTP server, Apache/etc
role :app,  metafront_1, :jobs => true           # This may be the same as your `Web` server
