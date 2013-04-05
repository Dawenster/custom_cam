class Category < ActiveRecord::Base
  attr_accessible :title
  has_many :contests

  validates :title, :presence => true
end
