class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_admin!

  include FileOutputHelper

  def handle_file_output_request
    output_latest_taptaro_files
    redirect_to :back
  end

end
