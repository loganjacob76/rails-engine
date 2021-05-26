class API::V1::MerchantItemsController < API::APIController
  def index
    items = merchant.items

    render json: ItemSerializer.new(items)
  end

  private

  def merchant
    Merchant.find(params[:merchant_id])
  end
end