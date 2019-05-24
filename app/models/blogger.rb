class Blogger < ApplicationRecord
  has_many :posts
  has_many :destinations, through: :posts

  validates :name, uniqueness: true
  validates :age, numericality: {only_integer: true, greater_than: 0}
  validates :bio, length: {minimum: 31}

  def total_likes
    posts.map {|post| post.likes}.sum
  end

  def most_liked
    featured = posts.max_by {|post| post.likes}
    if featured != nil
      featured.title
    else
      "No Featured Post to Show Yet, Share Your Posts!"
    end
  end

  def top_destinations
    hash = Hash.new

    sorted =  posts.sort_by {|post| post.destination}.group_by {|post| post.destination.id}.sort_by {|k, v| -v.size}.to_h

    for_k =sorted.keys[0..4]

    for_v = sorted.values.map {|values| values.size}[0..4]

    for_k.each do |destination_id|
      i = 0
      hash[destination_id] = for_v[i]
      i += 1
    end
    hash
  end


end
