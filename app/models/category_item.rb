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

  mount_uploader :audio_clip, AudioClipUploader

  validates :romaji, presence: true, length: { maximum: 25 }
  validates :kana, presence: true, length: { maximum: 25 }
  validates :title, presence: true, length: { maximum: 25 }
  validates :audio_clip, presence: true

end
