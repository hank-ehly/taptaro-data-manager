# == Schema Information
#
# Table name: user_messages
#
#  id         :integer          not null, primary key
#  message    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserMessage < ActiveRecord::Base

  validates :message, presence: true, allow_blank: false

end
