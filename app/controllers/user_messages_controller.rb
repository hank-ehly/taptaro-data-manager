class UserMessagesController < ApplicationController

  def create

    if params[:message]
      user_message = UserMessage.new(message: params[:message])
      if user_message.save!
        UserMessageMailer.taptaro_notification_email(user_message).deliver
      end
    end

    render :nothing => true

  end
end
