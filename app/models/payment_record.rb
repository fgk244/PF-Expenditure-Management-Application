class PaymentRecord < ApplicationRecord

  attachment :voucher

  belongs_to :category
  belongs_to :budget

end
