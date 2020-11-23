class Designer < ApplicationRecord
   has_many :rooms 
   has_many :pieces, through: :rooms
   has_secure_password #authenticate method, validate password
end
