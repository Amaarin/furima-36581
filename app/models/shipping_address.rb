class ShippingAddress < ApplicationRecord
  with_options presence: true do
    validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :city
    validates :address 
    validates :phone_number
  end
  belongs_to :buy
end

