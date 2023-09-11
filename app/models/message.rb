class Message < ApplicationRecord
  self.table_name = "messages"
  belongs_to :user
  belongs_to :room
end
