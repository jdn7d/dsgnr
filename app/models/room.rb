class Room < ApplicationRecord
  belongs_to :designer
  has_many :reference_photos
  has_many :pieces
  has_many :stores, through: :pieces
end
