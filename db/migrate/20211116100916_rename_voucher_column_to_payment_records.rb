class RenameVoucherColumnToPaymentRecords < ActiveRecord::Migration[5.2]
  def change
    rename_column :payment_records, :voucher, :voucher_id
  end
end
