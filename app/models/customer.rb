class Customer < ApplicationRecord
  has_many :invoices, dependent: :destroy
  has_many :transactions, through: :invoices
  
  validates :first_name, presence: :true
  validates :last_name, presence: :true
end