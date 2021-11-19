class PaymentRecord < ApplicationRecord

  attachment :voucher

  belongs_to :category
  # belongs_to :budget
  belongs_to :budget, optional: true

end
