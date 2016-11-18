module FileOutputHelper

  require 'zip_file_generator'

  def get_latest_taptaro_files
    set_current_timestamp
    create_root_dir
    output_taptaro_files
    "#{get_root_dir_path}.zip"
  end

  def output_taptaro_files
    output_categories
    output_category_items
    copy_audio_clips
    zip_exported_files
    delete_uncompressed_files
  end

  def copy_audio_clips
    copy_female_audio_clips
    copy_slow_female_audio_clips
    copy_male_audio_clips
    copy_slow_male_audio_clips
  end

  def create_root_dir
    dir_name = create_root_dir_name
    dir_path = create_root_dir_path(dir_name)
    Dir.mkdir(dir_path, 0755) unless Dir.exist?(dir_path)
  end

  def copy_female_audio_clips
    src = Rails.root.join('public', 'uploads', 'slow_female_audio_clip')
    dest = get_root_dir_path
    FileUtils.cp_r(src, dest)
  end

  def copy_slow_female_audio_clips
    src = Rails.root.join('public', 'uploads', 'female_audio_clip')
    dest = get_root_dir_path
    FileUtils.cp_r(src, dest)
  end

  def copy_male_audio_clips
    src = Rails.root.join('public', 'uploads', 'male_audio_clip')
    dest = get_root_dir_path
    FileUtils.cp_r(src, dest)
  end

  def copy_slow_male_audio_clips
    src = Rails.root.join('public', 'uploads', 'slow_male_audio_clip')
    dest = get_root_dir_path
    FileUtils.cp_r(src, dest)
  end

  def output_categories
    categories = Category.all.to_csv(col_sep: "\t")
    output_csv_records_to_filename(categories, 'categories')
  end

  def output_category_items
    category_items = CategoryItem.all.to_csv(col_sep: "\t")
    output_csv_records_to_filename(category_items, 'category_items')
  end

  def output_csv_records_to_filename(records, filename)
    parent_dir = get_root_dir_path
    file = File.open("#{parent_dir}/#{filename}.csv", 'w')
    file.write(records)
    file.close
  end

  def zip_exported_files
    directory_to_zip = get_root_dir_path
    output_file = "#{directory_to_zip}.zip"
    zip_file_generator = ZipFileGenerator.new(directory_to_zip, output_file)
    zip_file_generator.write
  end

  def delete_uncompressed_files
    root_dir = get_root_dir_path
    FileUtils.rm_rf(root_dir)
  end

  def get_root_dir_path
    timestamp = get_current_timestamp
    Rails.root.join('tmp', "taptaro_export_#{timestamp}")
  end

  def create_root_dir_path(dir_name)
    tmp_dir_path = Rails.root.join('tmp')
    tmp_dir_path + dir_name
  end

  def create_root_dir_name
    timestamp = get_current_timestamp
    "taptaro_export_#{timestamp}"
  end

  @@current_timestamp
  TIMESTAMP_FORMAT='%Y%m%d%H%M%S'

  def set_current_timestamp
    @@current_timestamp = Time.now.strftime(TIMESTAMP_FORMAT)
  end

  def get_current_timestamp
    @@current_timestamp
  end

end
