class Room < ApplicationRecord
    validates :name, uniqueness: true, presence: true

    belongs_to :designer
    has_many :reference_photos, dependent: :destroy
    has_many :pieces, dependent: :destroy
    has_many :stores, through: :pieces
end
