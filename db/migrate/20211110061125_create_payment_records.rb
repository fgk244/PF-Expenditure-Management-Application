class CreatePaymentRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :payment_records do |t|

      t.integer :category_id
      t.string :budgetary
      t.string :date
      t.integer :payment
      t.string :payment_method
      t.string :memo
      t.string :voucher_id
      t.integer :user_id

      # t.datetime :created_at
      # t.datetime :updated_at

      t.timestamps
    end
  end
end
