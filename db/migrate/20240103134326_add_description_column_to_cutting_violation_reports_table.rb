# frozen_string_literal: true

# Adds description column to leidimas table
class AddDescriptionColumnToCuttingViolationReportsTable < ActiveRecord::Migration[7.1]
  def change
    add_column :cutting_violation_reports, :description, :text, null: false
  end
end
