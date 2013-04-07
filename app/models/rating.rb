class Rating < ActiveRecord::Base
  belongs_to :photo
  belongs_to :user
  attr_accessible :value, :photo_id, :user_id
end
