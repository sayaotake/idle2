class Capture < ApplicationRecord
  self.table_name = "captures"
  belongs_to :event
  belongs_to :user
  validates_uniqueness_of :event_id, scope: :user_id
end

