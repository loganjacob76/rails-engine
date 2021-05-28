require 'rails_helper'

RSpec.describe Merchant do
  describe 'relationships' do
    it { should have_many(:invoices).dependent(:destroy) }
    it { should have_many(:items).dependent(:destroy) }
    it { should have_many(:invoice_items).through(:invoices) }
  end

  describe 'validations' do
    it { should validate_presence_of :name}
  end

  describe 'class methods' do
    before :each do
      m1 = create(:merchant)
      m2 = create(:merchant)
      m3 = create(:merchant)
      m4 = create(:merchant)

      i1 = create(:invoice, merchant: m1)
      i2 = create(:invoice, merchant: m2)
      i3 = create(:invoice, merchant: m3)
      i4 = create(:invoice, merchant: m4)
      
      ii1 = create(:invoice_item, invoice: i1)
      ii2 = create(:invoice_item, invoice: i2)
      ii3 = create(:invoice_item, invoice: i3)
      ii4 = create(:invoice_item, invoice: i4)

      t1 = create(:transaction, invoice: i1)
      t2 = create(:transaction, invoice: i2)
      t3 = create(:transaction, invoice: i3)
      t4 = create(:transaction, invoice: i4)
    end
    
    it '.by_revenue' do
      expect(Merchant.by_revenue(3).count).to eq(3)
    end
  end
end