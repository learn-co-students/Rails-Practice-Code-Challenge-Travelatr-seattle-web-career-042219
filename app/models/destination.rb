class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def self.top_5_destinations
        # A list of that user's top 5 most written about destinations (the destinations with the most posts)
        Destination.order(posts: :desc).limit(5)
        byebug
    end
end
