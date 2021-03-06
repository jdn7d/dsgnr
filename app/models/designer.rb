class Designer < ApplicationRecord
   validates :email, uniqueness: true 

   has_many :rooms 
   has_many :pieces, through: :rooms
   has_many :reference_photos, through: :rooms
   has_many :stores, through: :pieces
   has_secure_password
  
end
