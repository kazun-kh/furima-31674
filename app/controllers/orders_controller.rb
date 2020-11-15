class OrdersController < ApplicationController
  def index
    # binding.pry
    @item = Item.find(params[:item_id])
    @user_item = UserItem.new
  end

 
  def create
    # binding.pry
    @user_item = UserItem.new(item_params)   
     if @user_item.valid?
       @user_item.save
       redirect_to action: :index
     end
  end

    private
    def item_params
     params.require(:user_item).permit(:postal_code, :prefecture, :nickname, :prefecture, :city, :house_number, :building_name, :phone_number)
    end
end
