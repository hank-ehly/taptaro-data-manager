class CategoryItem < ActiveRecord::Base
  belongs_to :category

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      all.each do |category_item|
        csv << category_item.attributes.values_at(*column_names)
      end
    end
  end

end
