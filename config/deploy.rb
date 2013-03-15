require "rvm/capistrano"
require "bundler/capistrano"

set :application, "metacraft"
set :repository,  "git@github.com:pirtlj/MetaCraft.git"



set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names # Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :branch, "master"
set :deploy_via, :remote_cache

set :user, "capistrano"
set :use_sudo, false
ssh_options[:forward_agent] = true


set :normalize_asset_timestamps, false


role :web, "ec2-184-73-44-143.compute-1.amazonaws.com"                         # Your HTTP server, Apache/etc
role :app, "ec2-184-73-44-143.compute-1.amazonaws.com", :jobs => true                         # This may be the same as your `Web` server

role :db,  "ec2-184-73-44-143.compute-1.amazonaws.com", :primary => true # This is where Rails migrations will run
role :db,  "ec2-184-73-44-143.compute-1.amazonaws.com"

set :deploy_to, "/var/www/sites/#{application}"



before 'deploy:setup', 'rvm:install_rvm'   # install RVM

# if you want to clean up old releases on each deploy uncomment this:

after 'deploy:create_symlink',  'deploy:migrate'
after "deploy:restart", "deploy:cleanup"
# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "cd #{current_path} && bundle exec thin -C config/thin.yml restart"
    #    run "cd #{current_path} && rake RAILS_ENV=production resque:scheduler"
    #    run "cd #{current_path} && rake resque:pool --daemon --environment production"
  end
end


namespace :resque do
  desc "Starts resque-pool daemon."
  task :start, :roles => :app, :only => { :jobs => true } do
    run "cd #{current_path} && bundle exec resque-pool -d -E #{rails_env} start"
  end

  desc "Sends INT to resque-pool daemon to close master, letting workers finish their jobs."
  task :stop, :roles => :app, :only => { :jobs => true } do
    pid = "#{current_path}/tmp/pids/resque-pool.pid"
    run "kill -2 `cat #{pid}`"
  end

  desc "Restart resque workers - actually uses resque.stop and lets God restart in due course."
  task :restart, :roles => :app, :only => { :jobs => true } do
    stop # let God restart.
  end

  desc "List all resque processes."
  task :ps, :roles => :app, :only => { :jobs => true } do
    run 'ps -ef | grep -E "[r]esque-(pool|[0-9])"'
  end

  desc "List all resque pool processes."
  task :psm, :roles => :app, :only => { :jobs => true } do
    run 'ps -ef | grep -E "[r]esque-pool"'
  end

end


