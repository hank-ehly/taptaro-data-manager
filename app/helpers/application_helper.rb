module ApplicationHelper

  def infer_alert_class_by_flash_key(key='')
    key == 'notice' || key == 'alert' ? 'info' : key
  end

  def display_errors_for_object(object)
    render partial: 'common/error_message', locals: { :object => object }
  end

end
