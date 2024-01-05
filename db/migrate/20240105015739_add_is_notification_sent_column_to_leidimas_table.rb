# frozen_string_literal: true

# Adds column to identify if notifications for leidimas were sent
class AddIsNotificationSentColumnToLeidimasTable < ActiveRecord::Migration[7.1]
  def change
    add_column :kirtimu_leidimai, :is_notification_sent, :boolean, null: false, default: 0
    add_index :kirtimu_leidimai, :is_notification_sent
  end
end
