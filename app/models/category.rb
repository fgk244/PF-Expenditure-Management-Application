class Category < ApplicationRecord

  has_many :payment_records
  # validates :category_name, presence: true

  belongs_to :user

end
