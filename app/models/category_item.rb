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
#  audio_clip  :string
#

class CategoryItem < ActiveRecord::Base
  belongs_to :category

  mount_uploader :female_audio_clip, FemaleAudioClipUploader
  mount_uploader :male_audio_clip, MaleAudioClipUploader

  validates :romaji, presence: true, length: { maximum: 25 }
  validates :kana, presence: true, length: { maximum: 25 }
  validates :title, presence: true, length: { maximum: 25 }

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |category_item|
        csv << category_item.attributes.values_at(*column_names)
      end
    end
  end

end
