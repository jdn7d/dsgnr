class Store < ApplicationRecord
   validates :name, uniqueness: true 
   scope :current_designers_rooms, -> { where(designer_id: current_deisgner) }
   
   has_many :pieces
   has_many :rooms, through: :pieces 
end
