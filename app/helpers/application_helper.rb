module ApplicationHelper

  def self.typeOfAlertForKey(key='')
    key == 'notice' || key == 'alert' ? 'info' : key
  end

end
