# frozen_string_literal: true

# Adds Cutting violation report table
class AddCuttingViolationReportTable < ActiveRecord::Migration[7.1]
  def change
    create_table :cutting_violation_reports do |t|
      t.integer :user_id, null: false
      t.integer :cutting_permit_id, null: false
      t.timestamps
    end
  end
end
