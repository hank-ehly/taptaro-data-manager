class UserMessagesController < ApplicationController

  def create
    success = false

    if params[:message]
      user_message = UserMessage.new(message: params[:message])
      if user_message.save!
        success = true
      end
    end

    render json: {result: success.to_s}

  end
end
