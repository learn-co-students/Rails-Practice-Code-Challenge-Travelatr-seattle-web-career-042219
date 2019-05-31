class Post < ApplicationRecord
    belongs_to :destination
    belongs_to :blogger

    def self.total_likes
        # The total likes on all of that blogger's post
        Post.sum(:likes)
    end

    def self.featured_post
        # A link to that blogger's featured post (the post with the most likes)
        Post.order(likes: :desc).first.title
    end

    def self.top_5_destinations
        # A list of that user's top 5 most written about destinations (the destinations with the most posts)
        Post.order(likes: :desc).limit(5)
    end



end
