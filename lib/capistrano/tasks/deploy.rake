namespace :deploy do

  namespace :check do

    desc "Upload the linked files listed in deploy.rb"
    task :upload_linked_files do
      on roles(:app) do
        execute "mkdir -p #{shared_path}/config"
        fetch(:linked_files).each do |file|
          upload! StringIO.new(File.read(file)), "#{shared_path}/#{file}"
        end
      end
    end

    before "deploy", "deploy:check:upload_linked_files"

  end

  desc "Restart passenger via `touch tmp/restart.txt`"
  task :restart_passenger do
    on roles(:app) do
      execute "touch tmp/restart.txt"
    end
  end

  after "deploy", "deploy:restart_passenger"

end