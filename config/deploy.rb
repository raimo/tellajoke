set :application, "tellajoke"
set :repository,  "http://github.com/railsrumble/rr10-team-311"

set :scm_username, 'tellajoke'
set :scm_password, 'telljuhaniapetrijoke'

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/home/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
set :scm, :git

role :app, "173.255.195.81"
role :web, "173.255.195.81"
role :db,  "173.255.195.81", :primary => true
