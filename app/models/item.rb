class Item < ApplicationRecord
  has_many :invoice_items, dependent: :destroy
  has_many :invoices, through: :invoice_items
  belongs_to :merchant

  validates :name, presence: true
  validates :description, presence: true
  validates :unit_price, presence: true, numericality: true
  validates :merchant_id, presence: true, numericality: true

  def self.by_revenue(quantity)
    joins(invoices: :transactions)
    .where("transactions.result = 'success'")
    .group(:id)
    .select('items.*, sum(invoice_items.quantity * invoice_items.unit_price) as revenue')
    .order(revenue: :desc)
    .limit(quantity)
  end
end