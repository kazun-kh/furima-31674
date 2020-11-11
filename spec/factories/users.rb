FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {"空条"}
    first_name            {"承太郎"}
    last_name_kana        {"クウジョウ"}
    first_name_kana       {"ジョウタロウ"}
    birth_date            {"2020-11-11"}
  end
end