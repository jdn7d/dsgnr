class Designer < ApplicationRecord
   has_many :rooms 
   has_many :pieces, through: :rooms
end
