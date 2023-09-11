class Room < ApplicationRecord
    self.table_name = "rooms"
    has_many :messages, dependent: :destroy
    has_many :entries, dependent: :destroy
end
