class ItemsController < ApplicationController
  
  before_action :move_to_index, except: :index

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: :index
    else
      render action: :new
    end

    def show
      @item = Item.find(params[:id])
    end

  end

  private

  def item_params
    params.require(:item).permit(:name, :info, :price, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :image).merge(user_id: current_user.id)
  end
 
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
