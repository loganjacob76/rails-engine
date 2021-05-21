require 'rails_helper'

RSpec.describe Invoice do
  describe 'relationships' do
    it { should have_many(:invoice_items).dependent(:destroy) }
    it { should have_many(:transactions).dependent(:destroy) }
    it { should belong_to :customer }
    it { should belong_to :merchant }
  end

  describe 'validations' do
    it { should validate_presence_of :customer_id }
    it { should validate_presence_of :merchant_id }
    it { should validate_presence_of :status }

    it { should validate_numericality_of :customer_id }
    it { should validate_numericality_of :merchant_id }
  end
end