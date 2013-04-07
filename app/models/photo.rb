class Photo < ActiveRecord::Base
  attr_accessible :description, :body, :url, :contest_id, :user_id
  belongs_to :user
  belongs_to :contest
  has_many :comments, :as => :commentable
  has_many :ratings

  validates :user_id, :presence => true
  validates :url, :presence => true

  mount_uploader :url, PhotoUploader
end
