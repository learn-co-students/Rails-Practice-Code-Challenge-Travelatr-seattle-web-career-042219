class Post < ApplicationRecord
    belongs_to :destination
    belongs_to :blogger

    validates :title, presence: true
    validates :content, length: {minimum: 100}

    # The total likes on all of that blogger's post
    def self.total_likes
        Post.sum(:likes)
    end

     # A link to that blogger's featured post (the post with the most likes)
    def self.featured_post
         Post.order(likes: :desc).distinct.first ? Post.order(likes: :desc).distinct.first.title : nil
    end

    # A list of that user's top 5 most written about destinations (the destinations with the most posts)
    def self.top_5_destinations
        Post.order(likes: :desc).limit(5)
    end

    # The most recent 5 posts written about this destination
    def self.most_recent_posts
        Post.order(created_at: :desc).limit(5)
    end

    # The average age of all unique bloggers who have written about this destination
    def self.average_age
        Blogger.average("age").to_i
    end

end