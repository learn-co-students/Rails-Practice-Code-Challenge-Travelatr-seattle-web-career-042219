class Destination < ApplicationRecord
  has_many :posts
  has_many :bloggers, through: :posts

  def five_most_recent
    array = posts.sort_by {|post| -post.id}
    if array.size < 5
      array
    else
      array[0..4]
    end
  end

  def most_liked
    posts.sort_by {|post| -post.likes}.first
  end

  def average_blogger_age
    ages = posts.map {|post| post.blogger.age.to_f}
    avg = ages.sum/ages.size
    '%.2f' % avg
  end
end
