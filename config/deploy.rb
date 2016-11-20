lock '3.4.0'
set :application, 'taptaro_data_manager'
set :repo_url, 'git@taptaro_data_manager.github.com:hank-ehly/taptaro-data-manager.git'
set :deploy_to, '/var/www/html/taptaro_data_manager'
set :linked_files, fetch(:linked_files, []).push('config/secrets.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')
set :keep_releases, 4
set :passenger_restart_with_touch, true
