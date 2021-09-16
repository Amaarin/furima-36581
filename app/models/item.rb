class Item < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :item_name
    validates :description
    with_options numericality: { other_than: 1 , message: "can't be blank"} do
      validates :category_id
      validates :status_id
      validates :shipping_cost_id
      validates :prefecture_id
      validates :scheduled_day_id
    end
    with_options numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 99999999 } do
      validates :price
    end
  end


  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :scheduled_day
  belongs_to :shipping_cost
  belongs_to :status
 
  
  def was_attached?
    self.image.attached?
  end
  # has_one :buy

end

