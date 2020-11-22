class Store < ApplicationRecord
   has_many :pieces
   has_many :rooms, through: :pieces 
end
