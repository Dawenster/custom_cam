class Contest < ActiveRecord::Base
  attr_accessible :title, :description, :category_id,
                  :price, :duration, :creator_id
  belongs_to :user
  belongs_to :category
  has_many :photos

  validates :title, :presence => true
  validates :description, :presence => true
  validates :category, :presence => true
  validates :price, :presence => true, :numericality => true
  validates :creator_id, :presence => true
end
