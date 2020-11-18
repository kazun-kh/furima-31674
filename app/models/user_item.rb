class UserItem

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city,  :house_number, :building_name, :phone_number, :token, :item_id, :user_id, :order_id

# ここにバリデーションの処理を書く
with_options presence: true do
 validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
 validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "City is invalid. Input full-width characters."}
 validates :house_number, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "House number is invalid. Input full-width characters."}
 validates :phone_number, format: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters."}
 validates :prefecture, numericality: { other_than: 1, message: "can't be blank" }
 validates :token
end

 #validates :building_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Building name is invalid. Input full-width characters."}

  def save
    # 各テーブルにデータを保存する処理を書く

  order = Order.create(user_id: user_id, item_id: item_id)
  Address.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  
  end
end