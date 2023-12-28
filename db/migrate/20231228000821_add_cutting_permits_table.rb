class AddCuttingPermitsTable < ActiveRecord::Migration[7.1]
  def change
    create_table :cutting_permits do |t|
      t.string :_type, null: true
      t.string :_id, null: true
      t.string :_revision, null: true
      t.float :numeris, null: true
      t.string :serija, null: true
      t.string :tipas, null: true
      t.float :kad_sklypo_nr, null: true
      t.string :mu_id, null: true
      t.string :ur_gir_id, null: true
      t.string :strukp_id, null: true
      t.timestamps
    end
  end
end
