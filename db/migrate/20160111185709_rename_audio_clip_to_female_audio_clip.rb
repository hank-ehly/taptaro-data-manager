class RenameAudioClipToFemaleAudioClip < ActiveRecord::Migration
  def change
    rename_column :category_items, :audio_clip, :female_audio_clip
  end
end