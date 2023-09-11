class Like < ApplicationRecord
  self.table_name = "likes"
  belongs_to :video
  belongs_to :user

  validates_uniqueness_of :video_id, scope: :user_id
end
