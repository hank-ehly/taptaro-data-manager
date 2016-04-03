# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :user_name            => ENV['TAPTARO_MODERATOR_EMAIL'],
    :password             => ENV['TAPTARO_MODERATOR_EMAIL_PASSWORD'],
    :authentication       => :plain,
    :enable_starttls_auto => true
}