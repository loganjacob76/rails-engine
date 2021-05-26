class API::V1::MerchantsController < API::APIController
  def index
    render json: MerchantSerializer.new(Merchant.all)
  end
end