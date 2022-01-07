class AddMissingLeidimaiIndex < ActiveRecord::Migration[6.1]
  def change
    add_index :kirtimu_leidimai, :created_at
  end
end
