set :application, "tellajoke"
set :repository,  "git@github.com:raimo-t/tellajoke.git"

set :branch, "master"

set :user, 'tellajoke'
set :password, 'telljuhaniapetrijoke'

set :use_sudo, false
set :deploy_to, "/home/#{application}"
set :scm, :git

role :app, "173.255.195.81"
role :web, "173.255.195.81"
role :db,  "173.255.195.81", :primary => true


namespace :deploy do
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end
end
