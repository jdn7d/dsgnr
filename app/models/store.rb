class Store < ApplicationRecord
   validates :name, uniqueness: true 
   has_many :pieces
   has_many :rooms, through: :pieces 
end
