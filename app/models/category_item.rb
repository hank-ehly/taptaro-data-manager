# == Schema Information
#
# Table name: category_items
#
#  id          :integer          not null, primary key
#  romaji      :string
#  kana        :string
#  title       :string
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class CategoryItem < ActiveRecord::Base
  belongs_to :category

  # mount_uploader :audio_clip, AudioClipUploader
  # TODO: Add 'audio_clip' property to CategoryItem class

  validates :romaji, presence: true, length: {maximum: 25}
  validates :kana, presence: true, length: {maximum: 25}
  validates :title, presence: true, length: {maximum: 25}

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      all.each do |category_item|
        csv << category_item.attributes.values_at(*column_names)
      end
    end
  end

end
