class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, except: [:index, :show]
  
  

  def index
    @items = Item.includes(:user).order("created_at DESC")
    @orders = Order.all
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
  end

  def show
  end

  def edit
    unless @item.user_id == current_user.id
      redirect_to action: :index
    end
  end

  def update
    if @item.update(item_params)
      
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
   if @item.user_id == current_user.id
    @item.destroy
    redirect_to root_path
  else
    render :show
   end
  end

  

  private

  def item_params
    params.require(:item).permit(:name, :info, :price, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
 
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
