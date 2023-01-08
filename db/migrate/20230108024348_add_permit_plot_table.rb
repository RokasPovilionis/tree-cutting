# frozen_string_literal: true

# Adds Table that conects permits to plots
class AddPermitPlotTable < ActiveRecord::Migration[6.1]
  def change
    create_table :permit_plot do |t|
      t.bigint :permit_id, null: false
      t.bigint :plot_id, null: false
      t.timestamps
    end

    add_index :permit_plot, :permit_id
    add_index :permit_plot, :plot_id
  end
end
