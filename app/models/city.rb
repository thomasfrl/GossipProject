class City < ApplicationRecord
    has_many :users

    def adress
        "#{self.name} #{self.zip_code}"
    end

    validates :name, presence: true
    validates :zip_code, presence: true, uniqueness: true
end
