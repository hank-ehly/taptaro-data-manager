class UserMessageMailer < ApplicationMailer

  default from: ENV['TAPTARO_MODERATOR_EMAIL']

  def taptaro_notification_email(message)
    @message = message
    mail(:to => ENV['TAPTARO_MODERATOR_EMAIL'], subject: 'A new taptaro message has been received.')
  end

end
