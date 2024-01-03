# frozen_string_literal: true

# Adds changes relation column to leidimas table
class ChangeColumnForViolationRelation < ActiveRecord::Migration[7.1]
  def change
    remove_column :cutting_violation_reports, :cutting_permit_id, :integer, null: false
    add_column :cutting_violation_reports, :leidimas_id, :integer, null: false
  end
end
