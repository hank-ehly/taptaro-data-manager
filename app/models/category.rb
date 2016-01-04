# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ActiveRecord::Base
	has_many :category_items

  validates :title, presence: true, length: {maximum: 25}

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      all.each do |category|
        csv << category.attributes.values_at(*column_names)
      end
    end
  end

end
