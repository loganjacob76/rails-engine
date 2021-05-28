require 'rails_helper'

RSpec.describe 'merchants endpoint' do
  before :each do
    @merchant = create(:merchant)
  end
  
  describe 'merchants endpoints' do
    it 'get all merchants' do
      get '/api/v1/merchants'

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(response.content_type).to eq('application/json')

      merchants = JSON.parse(response.body, symbolize_names: true)

      expect(merchants).to be_a Hash
      expect(merchants).to have_key(:data)
      expect(merchants[:data]).to be_a Array
      
      mdata = merchants[:data].first
      expect(mdata).to be_a Hash
      expect(mdata).to have_key(:id)
      expect(mdata[:id]).to be_a String

      expect(mdata).to have_key(:type)
      expect(mdata[:type]).to be_a String
      
      expect(mdata).to have_key(:attributes)
      expect(mdata[:attributes]).to be_a Hash
      expect(mdata[:attributes]).to have_key(:name)
      expect(mdata[:attributes][:name]).to be_a String
    end

    it 'get one merchant' do
      get "/api/v1/merchants/#{@merchant.id}"
      
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(response.content_type).to eq('application/json')

      merchant = JSON.parse(response.body, symbolize_names: true)

      expect(merchant).to be_a Hash
      expect(merchant).to have_key(:data)
      expect(merchant[:data]).to be_a Hash
      
      mdata = merchant[:data]
      expect(mdata).to be_a Hash
      expect(mdata).to have_key(:id)
      expect(mdata[:id]).to be_a String

      expect(mdata).to have_key(:type)
      expect(mdata[:type]).to be_a String
      
      expect(mdata).to have_key(:attributes)
      expect(mdata[:attributes]).to be_a Hash
      expect(mdata[:attributes]).to have_key(:name)
      expect(mdata[:attributes][:name]).to be_a String
    end
  end
end