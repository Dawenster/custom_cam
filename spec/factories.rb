FactoryGirl.define do

  factory :photo do
    description { Faker::Lorem.sentence }
    url "/path/image.jpg"
  end

  factory :user do
    username { Faker::Name.name }
    email { Faker::Internet.email }
    password '123456'
    password_confirmation '123456'
  end

  factory :contest do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    category
    price 100
    creator_id 1
  end

  factory :category do
    title { Faker::Lorem.word }
  end
end
