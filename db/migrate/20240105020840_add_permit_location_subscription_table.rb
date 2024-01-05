# frozen_string_literal: true

# Adds table for permit location subscriptions that users have
class AddPermitLocationSubscriptionTable < ActiveRecord::Migration[7.1]
  def change
    create_table :permit_location_subscriptions do |t|
      t.integer :user_id, null: false
      t.string :girininkija, null: false
      t.integer :kvartalas
      t.timestamps
    end

    add_index :permit_location_subscriptions, :user_id
    add_index :permit_location_subscriptions, %w[girininkija kvartalas]
  end
end
