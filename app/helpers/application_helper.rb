module ApplicationHelper

  # @param [String] key
  # @return [String]
  def infer_alert_class_by_flash_key(key='')
    key == 'notice' || key == 'alert' ? 'info' : key
  end

  # @param ActiveRecord object
  # @return :partial
  def display_errors_for_object(object)
    render partial: 'common/error_message', locals: { :object => object }
  end

end
