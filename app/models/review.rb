class Review < ApplicationRecord
  self.table_name = "reviews"
  belongs_to :user
  belongs_to :photo
end
