set :bundle_without, [:development, :test, :worker]

role :web,  metafront_1                       # Your HTTP server, Apache/etc
role :app,  metafront_1, :jobs => true           # This may be the same as your `Web` server

role :db,  "ec2-184-73-44-143.compute-1.amazonaws.com", :primary => true # This is where Rails migrations will run
role :db,  "ec2-184-73-44-143.compute-1.amazonaws.com"

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "cd #{current_path} && bundle exec thin -C config/thin.yml restart"
  end
end