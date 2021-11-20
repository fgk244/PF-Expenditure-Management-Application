class AddUserIdToPaymentRecords < ActiveRecord::Migration[5.2]
  def change
     add_column :payment_records, :user_id, :integer
  end
end
