require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の情報を登録' do
    context '出品がうまくいくとき' do
        
        it "image,name,info、price,category,sales_status,shipping_fee_status,prefecture,scheduled_deliveryが存在すれば登録できる" do
          expect(@item).to be_valid
        end

  
        context '出品登録がうまくいかないとき' do 
     
          it "imageが空だと登録できない" do
            @item.image = nil
            @item.valid?
            expect(@item.errors.full_messages).to include("Image can't be blank")
          end

          it "nameが空だと登録できない" do
            @item.name = ''
            @item.valid?
            expect(@item.errors.full_messages).to include("Name can't be blank")
          end

          it "infoが空だと登録できない" do
            @item.info = ''
            @item.valid?
            expect(@item.errors.full_messages).to include("Info can't be blank")
          end

          it "priceが空だと登録できない" do
            @item.price = ''
            @item.valid?
            expect(@item.errors.full_messages).to include("Price can't be blank")
          end

          it "category_idが空だと登録できない" do
            @item.category_id = ''
            @item.valid?
            expect(@item.errors.full_messages).to include("Category is not a number")
          end

          it "sales_status_idが空だと登録できない" do
            @item.sales_status_id = ''
            @item.valid?
            expect(@item.errors.full_messages).to include("Sales status is not a number")
          end

          it "shipping_fee_status_idが空だと登録できない" do
            @item.shipping_fee_status_id = ''
            @item.valid?           
            expect(@item.errors.full_messages).to include("Shipping fee status is not a number")
          end

          it "prefecture_idが空だと登録できない" do
            @item.prefecture_id = ''
            @item.valid?
            expect(@item.errors.full_messages).to include("Prefecture is not a number")
          end

          it "scheduled_delivery_idが空だと登録できない" do
            @item.scheduled_delivery_id = ''
            @item.valid?
            expect(@item.errors.full_messages).to include("Scheduled delivery is not a number")
          end

          it 'priceが300円未満では保存できないこと' do
            @item.price = 299
            @item.valid?
            expect(@item.errors.full_messages).to include("Price is out of setting range")
          end

          it 'priceが9,999,999円を超過すると保存できないこと' do
            @item.price = 10000000
            @item.valid?
            expect(@item.errors.full_messages).to include("Price is out of setting range")
          end

          it 'priceが全角数字だと保存できないこと' do
            @item.price = '２０００'
            @item.valid?
            expect(@item.errors.full_messages).to include("Price is out of setting range")
          end




          
        
        
        
        
        
        
        
        
        
        
        end




    end

  end

end
