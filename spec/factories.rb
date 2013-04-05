FactoryGirl.define do

  factory :photo do
    description Faker::Lorem.sentence
    url "/path/image.jpg"
    contest_id
    user_id
  end

  factory :user do
    username Faker::Name.name
    email Faker::Internet.email
    password '123456'
    password_confirmation '123456'
  end

  factory :contest do
    title Faker::Lorem.sentence
    description Faker::Lorem.paragraph
    category
    price rand(100..1000)
    creator_id 1
  end

  factory :category do
    title Faker::Lorem.word
  end
end
