class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user

  has_one_attached :image

  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :delivery_day

  validates :image, :name, :description, :category_id, :status_id, :shipping_fee_status_id, :prefecture_id, :delivery_day_id, :price, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :category_id, :status_id, :shipping_fee_status_id, :delivery_day_id, :prefecture_id, numericality: { other_than: 1, message: "を選択してください" }
  validates :name, presence: true
  validates :description, presence: true


end

