class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts


    def self.full_name
        byebug
        self.full_name = [Destination.name, Destination.country].join(", ")
        byebug
    end
end
