class CreateLocationData < ActiveRecord::Migration[6.1]
  def change
    create_table :location_data do |t|
      t.references :user, null: false, foreign_key: true
      t.string :country, null: false
      t.string :address, null: false

      t.timestamps
    end
  end
end
