class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item, only: [:index, :create]
  
  def index
    @user_item = UserItem.new
    if @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def create
    @user_item = UserItem.new(item_params)   
     if @user_item.valid?
      pay_item
      @user_item.save
      redirect_to root_path
    else
      render :index
     end

  end

    private
    def item_params
     params.require(:user_item).permit(:postal_code, :prefecture, :nickname, :prefecture, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
    end

    def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: item_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )   
   end

   def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end

    def set_item
      @item = Item.find(params[:item_id])
    end
  end
end
