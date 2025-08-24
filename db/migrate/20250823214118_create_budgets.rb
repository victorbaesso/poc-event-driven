class CreateBudgets < ActiveRecord::Migration[8.0]
  def change
    create_table :budgets do |t|
      t.float :value
      t.date :deadline
      t.string :status

      t.timestamps
    end
  end
end
