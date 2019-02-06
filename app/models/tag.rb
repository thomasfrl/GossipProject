class Tag < ApplicationRecord
    has_many :tags_by_potins, dependent: :destroy
    has_many :gossips, through: :tags_by_potins  
end
