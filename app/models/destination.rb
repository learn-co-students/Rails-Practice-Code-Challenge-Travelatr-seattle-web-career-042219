class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    # The average age of all unique bloggers who have written about this destination
    def average_age
        self.bloggers.average("age").to_i
    end

    def full_name
        self.name.concat(", ", self.country)
    end

end
