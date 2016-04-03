class UserMessagesController < ApplicationController

  def create
    success = false

    if params[:message]
      user_message = UserMessage.new(message: params[:message])
      if user_message.save!
        UserMessageMailer.taptaro_notification_email(user_message).deliver
        success = true
      end
    end

    render json: {result: success.to_s}

  end
end
