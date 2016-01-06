module ApplicationHelper

  def self.infer_alert_class_by_flash_key(key='')
    key == 'notice' || key == 'alert' ? 'info' : key
  end

end
