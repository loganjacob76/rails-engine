require 'rails_helper'

RSpec.describe Customer do
  describe 'relationships' do
    it { should have_many(:invoices).dependent(:destroy) }
    it { should have_many :transactions }
  end

  describe 'validations' do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
  end
end