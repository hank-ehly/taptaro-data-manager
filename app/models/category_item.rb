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
  has_secure_token

  mount_uploader :female_audio_clip, FemaleAudioClipUploader
  mount_uploader :male_audio_clip, MaleAudioClipUploader
  mount_uploader :slow_female_audio_clip, SlowFemaleAudioClipUploader
  mount_uploader :slow_male_audio_clip, SlowMaleAudioClipUploader

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

  def self.get_play_icon_id_by_audio_clip(audio_clip={})
    get_id_by_type_for_audio_clip('play_icon', audio_clip)
  end

  def self.get_audio_clip_id_by_audio_clip(audio_clip={})
    get_id_by_type_for_audio_clip('audio_clip', audio_clip)
  end

  private

  def self.get_id_by_type_for_audio_clip(type='', audio_clip={})
    id = ''
    id += 'slow_' if audio_clip[:is_slow]
    id += audio_clip[:gender] + '_' + type
    id
  end

end
