class CreateSales < ActiveRecord::Migration[8.0]
  def change
    create_table :sales do |t|
      t.references :budget, null: false, foreign_key: true
      t.float :value

      t.timestamps
    end
  end
end
