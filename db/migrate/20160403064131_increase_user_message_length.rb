class IncreaseUserMessageLength < ActiveRecord::Migration
  def change
    change_table :user_messages do |t|
      t.change :message, :text
    end
  end
end
