class Piece < ApplicationRecord
  validates :name, uniqueness: true 
  scope :current_store_pieces, -> (store) { where(store_id: store.id) }

  belongs_to :room
  belongs_to :store
end
