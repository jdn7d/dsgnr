class Piece < ApplicationRecord
  belongs_to :room
  belongs_to :store
end
