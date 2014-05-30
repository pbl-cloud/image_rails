lock '3.2.1'

set :application, 'image_rails'
set :repo_url, 'https://github.com/pbl-cloud/image_rails.git'
set :branch, :master
set :scm, :git
set :deploy_to, '/home/image_rails/image_rails'

set :format, :pretty

set :log_level, :info

# set :pty, true

set :linked_files, %w{config/database.yml config/settings.local.yml config/secrets.yml}

set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/assets}

set :rails_env, 'production'

set :bundle_flags, '--deployment'
set :bundle_without, %w{development debug test deployment}.join(' ')

set :puma_conf, "#{shared_path}/config/puma.rb"

# set :keep_releases, 5

namespace :deploy do

  after :migrate, :seed do
    on roles(:db) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, 'db:seed'
        end
      end
    end
  end

  after :publishing, 'puma:restart'

  after 'puma:restart', :restart_delayed_jobs do
    on roles(:app) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, 'delayed_job:restart'
        end
      end
    end
  end

  after :restart, :clear_cache do
    on roles(:web) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, 'tmp:cache:clear'
        end
      end
    end
  end

end
