class Contest < ActiveRecord::Base
  attr_accessible :title, :description, :category_id,
                  :price, :duration, :creator_id
  
  belongs_to :user, :foreign_key => :creator_id
  belongs_to :category
  has_many :photos
  has_many :comments, :as => :commentable

  validates :title, :presence => true
  validates :description, :presence => true
  validates :category, :presence => true
  validates :price, :presence => true, :numericality => { :only_integer => true, :greater_than => 0 }
  validates :creator_id, :presence => true
end
