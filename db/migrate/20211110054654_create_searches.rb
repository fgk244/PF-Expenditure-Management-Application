class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|

      t.integer :user_id
      t.integer :payment_record_id
      t.string :date
      t.string :category
      t.string :payment_method
      t.string :memo
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
