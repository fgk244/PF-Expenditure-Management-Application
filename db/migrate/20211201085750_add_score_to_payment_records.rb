class AddScoreToPaymentRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :payment_records, :score, :decimal, precision: 5, scale: 3
  end
end
