class User < ApplicationRecord
  self.table_name = "users"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :image, ImageUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :videos, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_videos, through: :likes, source: :video

  has_many :photos, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_photos, through: :favorites, source: :photo
  has_many :reviews, dependent: :destroy

  has_many :events, dependent: :destroy
  has_many :captures, dependent: :destroy
  has_many :captured_events, through: :captures, source: :event
  has_many :opinions, dependent: :destroy

  validates :name, presence: true #追記
  validates :profile, length: { maximum: 200 } #追記

  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy

def already_liked?(video)
  self.likes.exists?(video_id: video.id)
end

def already_favorited?(photo)
  self.favorites.exists?(photo_id: photo.id)
end

def already_captured?(event)
  self.captures.exists?(event_id: event.id)
end

end
