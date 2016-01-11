class AddMaleAudioClipToCategoryItems < ActiveRecord::Migration
  def change
    add_column :category_items, :male_audio_clip, :string
  end
end