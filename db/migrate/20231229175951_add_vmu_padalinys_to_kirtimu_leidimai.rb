class AddVmuPadalinysToKirtimuLeidimai < ActiveRecord::Migration[7.1]
  def change
    add_column :kirtimu_leidimai, :vmu_padalinys, :string
    add_column :kirtimu_leidimai, :kadastrinis_sklypas, :string
    add_column :kirtimu_leidimai, :galiojimas, :string

    change_column_null(:kirtimu_leidimai, :regionas, true)
    change_column_null(:kirtimu_leidimai, :rajonas, true)
    change_column_null(:kirtimu_leidimai, :uredija, true)
    change_column_null(:kirtimu_leidimai, :kad_vietove, true)
  end
end
