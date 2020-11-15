class UserItem

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city,  :house_number, :building_name, :phone_number

# ここにバリデーションの処理を書く
with_options presence: true do
 validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
 validates :prefecture numericality: { other_than: 1, message: "can't be blank" }
 validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
 validates :house_number, format: { with: /\A[ぁ-んァ-ン一-龥]/, /\A[0-9]+\z/, message: "is invalid. Input full-width characters."}
 validates :phone_number, format: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters."}

end
validates :building_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}


  def save
    # 各テーブルにデータを保存する処理を書く
  end
end