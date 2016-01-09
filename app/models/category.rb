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
	has_many :category_items, dependent: :restrict_with_error

  validates :title, presence: true, length: { maximum: 25 }

end
