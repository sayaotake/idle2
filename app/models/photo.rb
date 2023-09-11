class Photo < ApplicationRecord
    self.table_name = "photos"
    belongs_to :user
    mount_uploader :image, ImageUploader
    has_many :favorites, dependent: :destroy
    has_many :favorited_users, through: :favorites, source: :user
    has_many :reviews, dependent: :destroy
end
