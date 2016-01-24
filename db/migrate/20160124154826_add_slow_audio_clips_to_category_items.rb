class AddSlowAudioClipsToCategoryItems < ActiveRecord::Migration
  def change
    add_column :category_items, :slow_female_audio_clip, :string
    add_column :category_items, :slow_male_audio_clip, :string
  end
end