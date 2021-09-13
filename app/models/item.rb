class Item < ApplicationRecord
  validates :image,             presence: true
  validates :item_name,         presence: true
  validates :description,       presence: true
  validates :category_id,       presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :status_id,         presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_cost_id,  presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id,     presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :scheduled_day_id,  presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :user,              presence: true
  with_options presence: true,numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 99999999 } do
    validates :price
  end


  belongs_to :user
  has_one_attached :image
  
  def was_attached?
    self.image.attached?
  end
  # has_one :buy

end

