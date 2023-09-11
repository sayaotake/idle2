class Opinion < ApplicationRecord
  self.table_name = "opinions"
  belongs_to :user
  belongs_to :event
end
