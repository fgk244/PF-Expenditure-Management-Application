class CreateBudgets < ActiveRecord::Migration[5.2]

  def change
    create_table :budgets do |t|

      t.string :budget_amount
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
