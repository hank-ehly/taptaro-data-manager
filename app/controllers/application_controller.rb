class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_admin!

  def export_csv()
    target = params[:target]

    case target
      when 'categories'
        send_data Category.all.to_csv
      when 'category_items'
        send_data CategoryItem.all.to_csv
      else
        flash[:danger] = "Could not export to CSV"
    end unless target.nil?

  end

end
