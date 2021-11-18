class Category < ApplicationRecord

  has_many :payment_record
  validates :category_name, presence: true

end
