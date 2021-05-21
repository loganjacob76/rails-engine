class Item < ApplicationRecord
  has_many :invoice_items, dependent: :destroy
  belongs_to :merchant

  validates :name, presence: true
  validates :description, presence: true
  validates :unit_price, presence: true, numericality: true
  validates :merchant_id, presence: true, numericality: true
end