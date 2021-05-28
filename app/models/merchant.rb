class Merchant < ApplicationRecord
  has_many :invoices, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :invoice_items, through: :invoices

  validates :name, presence: true

  def self.by_revenue(quantity)
    joins(invoices: [:invoice_items, :transactions])
    .where("invoices.status = 'shipped'")
    .where("transactions.result = 'success'")
    .group(:id)
    .select('merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) as revenue')
    .order(revenue: :desc)
    .limit(quantity)
  end
end
