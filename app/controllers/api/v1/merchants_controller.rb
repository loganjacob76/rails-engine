class API::V1::MerchantsController < API::APIController
  def index
    merchants = paginate(Merchant.all)
    render json: MerchantSerializer.new(merchants)
  end
end