class Category < ApplicationRecord

  has_many :payment_records
  belongs_to :user

end
