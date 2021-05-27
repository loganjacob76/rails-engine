class API::V1::ItemsController < API::APIController
  def index
    items = paginate(Item.all)
    render json: ItemSerializer.new(items)
  end

  def show
    render json: ItemSerializer.new(item)
  end

  def update
    if item.update(item_params)
      render json: ItemSerializer.new(item)
    else
      render json: ItemSerializer.new(item), status: :not_found
    end
  end

  def create
    new_item = Item.create(item_params)
    render json: ItemSerializer.new(new_item), status: :created
  end

  def destroy
    render json: ItemSerializer.new(item.destroy)
  end

  private

  def item
    Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :unit_price, :merchant_id)
  end
end