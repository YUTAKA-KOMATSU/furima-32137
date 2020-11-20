class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :burden_of_delivery
  belongs_to :category
  belongs_to :prefecture
  belongs_to :shipment_date
  belongs_to :state

  with_options presence: true do
    validates :name
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: {:greater_than_or_equal_to => 300, :less_than_or_equal_to => 9999999 }
    validates :introduction
    validates :category_id
    validates :state_id
    validates :burden_of_delivery_id
    validates :prefecture_id
    validates :shipment_date_id
    validates :image
  end
end

