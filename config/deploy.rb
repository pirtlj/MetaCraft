require "rvm/capistrano"
require "bundler/capistrano"
require "capistrano/ext/multistage"

set :application, "metacraft"
set :repository,  "git@github.com:pirtlj/MetaCraft.git"

set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names # Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :branch, "master"
set :deploy_via, :remote_cache

set :user, "capistrano"
set :use_sudo, false
ssh_options[:forward_agent] = true

set :normalize_asset_timestamps, false

set :deploy_to, "/var/www/sites/#{application}"

set :metafront_1, "ec2-184-73-44-143.compute-1.amazonaws.com"
set :metaworker_1,   "ec2-54-234-132-235.compute-1.amazonaws.com"


before 'deploy:setup', 'rvm:install_rvm'   # install RVM

# if you want to clean up old releases on each deploy uncomment this:

#after 'deploy:create_symlink',  'deploy:migrate'
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

