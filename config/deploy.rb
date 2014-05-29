lock '3.2.1'

set :application, 'image_rails'
set :repo_url, 'https://github.com/pbl-cloud/image_rails.git'
set :branch, :master
set :scm, :git
set :deploy_to, '/home/image_rails/image_rails'

set :format, :pretty

set :log_level, :info

# set :pty, true

set :linked_files, %w{config/database.yml config/settings.local.yml}

set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

set :rails_env, 'production'

set :bundle_flags, '--deployment'
set :bundle_without, %w{development debug test deployment}.join(' ')

set :puma_conf, "#{shared_path}/config/puma.rb"

# set :keep_releases, 5

namespace :deploy do

  after :publishing, 'puma:restart'

  after :restart, :clear_cache do
    on roles(:web) do
      within release_path do
        execute :rake, 'tmp:cache:clear'
      end
    end
  end

end
