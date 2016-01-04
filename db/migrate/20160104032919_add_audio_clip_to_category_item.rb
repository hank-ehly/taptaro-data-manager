class AddAudioClipToCategoryItem < ActiveRecord::Migration
  def change
    add_column :category_items, :audio_clip, :string
  end
end
