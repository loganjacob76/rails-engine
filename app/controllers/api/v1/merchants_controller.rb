class API::V1::MerchantsController < API::APIController
  def index
    merchants = paginate(Merchant.all)
    render json: MerchantSerializer.new(merchants)
  end

  def show
    render json: MerchantSerializer.new(merchant)
  end

  def find
    found = Merchant.find_by("name ilike ?", "%#{params[:name]}%")
    render json: MerchantSerializer.new(found) if found.present?
    render json: { data: {} } if found.nil?
  end
  
  private

  def merchant
    Merchant.find(params[:id])
  end
end