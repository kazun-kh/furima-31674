require 'rails_helper'

RSpec.describe UserItem, type: :model do
  describe '配送先の保存' do
    before do
      @user_item = FactoryBot.build(:user_item)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user_item).to be_valid
    end
    it '郵便番号(postal_code)が空だと保存できないこと' do
      @user_item.postal_code = nil
      @user_item.valid?
      expect(@user_item.errors.full_messages).to include("Postal code can't be blank")
    end
    it '郵便番号にはハイフンが必要であること（123-4567)となる場合でしか保存できないこと' do
      @user_item.postal_code = '1234567'
      @user_item.valid?
      expect(@user_item.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it '都道府県(prefecture)がないと保存できないこと' do
      @user_item.prefecture = nil
      @user_item.valid?
      expect(@user_item.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '市区町村(city)が空だと保存できないこと' do
      @user_item.city = nil
      @user_item.valid?
      expect(@user_item.errors.full_messages).to include("City can't be blank")
    end
    it '番地（house_number）が空だと保存できないこと' do
      @user_item.house_number = nil
      @user_item.valid?
      expect(@user_item.errors.full_messages).to include("House number can't be blank")
    end
    it '建物名(building_name)は空でも保存できること' do
      @user_item.building_name = ''
      expect(@user_item).to be_valid
    end
    it '電話番号(phone_number)が空だと保存できないこと' do
      @user_item.phone_number = nil
      @user_item.valid?
      expect(@user_item.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号にはハイフンは不要で、11桁以内で（09012345678となる）ないと保存できないこと' do
      @user_item.phone_number = '090-1234-5678'
      @user_item.valid?
      expect(@user_item.errors.full_messages).to include("Phone number is invalid. Input half-width characters.")
    end
    it 'tokenが空だと保存できないこと' do
      @user_item.token = nil
      @user_item.valid?
      expect(@user_item.errors.full_messages).to include("Token can't be blank")
    end
    
  end
end