class Photo < ActiveRecord::Base
  attr_accessible :title, :body
  belongs_to :user
  belongs_to :contest

  mount_uploader :url, PhotoUploader
end
