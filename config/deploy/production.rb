set :user, "production_user"
server "ec2-xxx-xxx-xxx-xxx.us-west-1.compute.amazonaws.com", :app, :web, :db, :primary => true
