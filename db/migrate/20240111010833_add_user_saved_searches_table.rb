# frozen_string_literal: true

# Adds table for searches that the user saved
class AddUserSavedSearchesTable < ActiveRecord::Migration[7.1]
  def change
    create_table :user_saved_searches do |t|
      t.integer :user_id, null: false
      t.string :search_name, null: false
      t.string :search_params, null: false
      t.timestamps
    end

    add_index :user_saved_searches, :user_id
  end
end
