class ApplicationController < ActionController::Base

    before_action :authenticate_admin!, only: [:handle_file_output_request, :download_to_local]

    include FileOutputHelper

    def handle_file_output_request
        output_path = get_latest_taptaro_files
        download_to_local(output_path)
    end

    def download_to_local(path='')
        filename = Pathname.new(path).basename
        File.open(path, 'r') do |f|
            send_data f.read, type: 'application/zip', :filename => filename
        end
        File.delete(path)
        puts "deleted #{path}"
    end

end
