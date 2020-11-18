FactoryBot.define do
  factory :user_item do
    postal_code { '123-4567' }
    prefecture { 2 }
    city { '戸田市' }
    house_number { '本町1-1' }
    building_name { 'スタープラチナ' }
    phone_number { '07012345678' }
    token {"tok_abcdefghijk00000000000000000"}
    
  end
end
