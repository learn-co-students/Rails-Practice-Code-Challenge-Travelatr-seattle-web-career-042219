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

# Users should be able to create and edit a post
# Users should be able to select a blogger from a dropdown menu
# Users should be able to select a destination from a dropdown menu
# A post should have a title
# A post should have content longer than 100 characters
# Users should be able to see a post's page with its title and content displayed. On this page, a user should see:
# A link to the page of that post's author
# A link to the page of that post's destination
# A like button link that increases the like count for that post (should take the user to the same page)