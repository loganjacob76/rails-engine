class API::V1::MerchantsController < API::APIController
  def index
    merchants = paginate(Merchant.all)
    render json: MerchantSerializer.new(merchants)
  end

  def show
    render json: MerchantSerializer.new(Merchant.find(params[:id]))
  end
end