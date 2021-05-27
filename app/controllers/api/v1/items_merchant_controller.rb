class API::V1::ItemsMerchantController < API::APIController
  def index
    item = Item.find(params[:item_id])

    render json: MerchantSerializer.new(item.merchant)
  end
end