class BuyShippingAddress
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'Input correctly' }
    validates :city
    validates :address
    validates :token
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'Input only number' }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  end

  def save
    buy = Buy.create(item_id: item_id, user_id: user_id)
    ShippingAddress.create(postal_code: postal_code, prefecture: prefecture, city: city, address: address, building_name: building_name)
  end
 

end