class CreateBudgetProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :budget_products do |t|
      t.float :value
      t.integer :quantity
      t.references :product, null: false, foreign_key: true
      t.references :budget, null: false, foreign_key: true

      t.timestamps
    end
  end
end
