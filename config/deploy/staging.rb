set :user, "ubuntu"
set :git_branch, 'deploy_env'
server "ec2-54-227-96-23.compute-1.amazonaws.com", :app, :web, :db, :primary => true