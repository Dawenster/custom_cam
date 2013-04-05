FactoryGirl.define do

  factory :photo do
    description "Super mega photo"
    url "asdf"
    contest_id 1
    user_id 1
  end

  factory :user do
    username Faker::Name.name
    email Faker::Internet.email
    password '123456'
    password_confirmation '123456'
  end 
end
