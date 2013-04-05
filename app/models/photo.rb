class Photo < ActiveRecord::Base
  attr_accessible :title, :body, :url
  belongs_to :user
  belongs_to :contest

  validates :user_id, :presence => true
  validates :url, :presence => true

  mount_uploader :url, PhotoUploader
end
