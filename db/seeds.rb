require 'faker'

categories = %w(Office Nature Family Animals Music Diversity Cities Holidays Sports Food Art Misc.)

categories.each do |category|
  Category.create(:title => category)
end

5.times do 
  User.create(:username => Faker::Name.name,
              :email => Faker::Internet.email,
              :password => "Whatever",
              :photographer => false)
end

20.times do
  User.create(:username => Faker::Name.name,
              :email => Faker::Internet.email,
              :password => "Whatever",
              :photographer => true)
end

50.times do 
  Contest.create(:title => Faker::Lorem.sentence,
                 :description => Faker::Lorem.paragraph,
                 :category_id => rand(1..12),
                 :price => rand(50..500),
                 :creator_id => rand(1..5))
end


100.times do
  Photo.create(:description => Faker::Lorem.sentence,
               :contest_id => rand(1..50),
               :user_id => rand(6..20))
end
