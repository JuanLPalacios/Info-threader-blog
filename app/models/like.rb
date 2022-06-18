class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def self.update_post_likes_counter(post)
    post.update(likes_counter: Like.where(post_id: post.id).length)
  end
end
