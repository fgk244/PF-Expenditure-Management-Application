class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.integer :user_id
      t.string :category_name
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
