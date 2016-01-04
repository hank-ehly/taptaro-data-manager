class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def export_csv(target=nil)
    case target
      when 'categories'
        send_data Category.all.to_csv
      when 'category_items'
        send_data CategoryItem.all.to_csv
      else
        render categories_path, danger: "Could not export to CSV"
    end unless target.nil?
  end

end
