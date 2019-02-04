class City < ApplicationRecord
    has_many :users
    def adress
        "#{self.name} #{self.zip_code}"
    end
end
