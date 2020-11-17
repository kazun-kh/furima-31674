class OrdersController < ApplicationController
  def index
    # binding.pry
    @item = Item.find(params[:item_id])
    @user_item = UserItem.new
  end

  def create
    @item = Item.find(params[:item_id])
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

    #"user_item"=>{"postal_code"=>"335-0023", "prefecture"=>"12", "city"=>"戸田市", "house_number"=>"本町5", "building_name"=>"星ビル", "phone_number"=>"07042961487"},
 #"token"=>"tok_e2af3eaf22c8e615e1d8e284590e",
 #"item_id"=>"1"}

    def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: item_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
     
   end
end
