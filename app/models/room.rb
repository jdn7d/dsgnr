class Room < ApplicationRecord
    validates :name, uniqueness: true, presence: true

    belongs_to :designer
    has_many :reference_photos
    has_many :pieces
    has_many :stores, through: :pieces
end
