FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    name { Faker::Name.name }
    birthdate { Faker::Date.birthday(18, 65) }
  end
end
