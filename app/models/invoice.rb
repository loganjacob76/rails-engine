class Invoice < ApplicationRecord
  has_many :invoice_items, dependent: :destroy
  has_many :transactions, dependent: :destroy
  belongs_to :customer
  belongs_to :merchant

  validates :customer_id, presence: true, numericality: true
  validates :merchant_id, presence: true, numericality: true
  validates :status, presence: true
end