set :bundle_without, [:development, :test, :production]

role :app,  metaworker_1, :jobs => true           # This may be the same as your `Web` server

namespace :deploy do
  namespace :assets do
    task :precompile do
    end
    
    task :symlink do
    end
    
    task :update_asset_mtimes do
    end
    
    task :clean_expired do
    end
  end
end