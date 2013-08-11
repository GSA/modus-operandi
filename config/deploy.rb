

# role :web, "your web-server here"                          # Your HTTP server, Apache/etc
# role :app, "your app-server here"                          # This may be the same as your `Web` server
# role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

set :stages, %w(staging)
set :default_stage, "staging"
require 'capistrano/ext/multistage'
set :application, "modus-operandi"
set :repository, "git@github.com:GSA-OCSIT/modus-operandi.git"
set :scm, :git
set :use_sudo, false
set :user, 'ubuntu'
ssh_options[:forward_agent] = true
default_run_options[:pty] = true
set :rvm_ruby_string, 'ruby-2.0.0-p247'
set :git_shallow_clone, 1
set :keep_releases, 5

set :shared_path, "/var/www/shared"

set :deploy_to, "/var/www/modus-operandi"

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  desc "copies shared config to app config"
	task :symlink_config do
		run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
	end

	desc "creates asset dirs"
	task :create_asset_dirs do
		run "mkdir -p #{release_path}/public/images"
		run "mkdir -p #{release_path}/public/stylesheets"
		run "mkdir -p #{release_path}/public/javascripts"
	end
end



after "deploy:finalize_update", "deploy:symlink_config"
before "deploy:finalize_update", "deploy:create_asset_dirs"