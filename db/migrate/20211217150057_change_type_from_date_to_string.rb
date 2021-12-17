# frozen_string_literal: true

# Changes column type from date to string
class ChangeTypeFromDateToString < ActiveRecord::Migration[6.1]
  def change
    change_column :valst_r_miskai, :lrv_data, :string, null: true
    change_column :misku_pogrupiai, :lrv_data, :string, null: false
  end
end
