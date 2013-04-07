class Rating < ActiveRecord::Base
  belongs_to :photo
  attr_accessible :value, :photo_id
end
