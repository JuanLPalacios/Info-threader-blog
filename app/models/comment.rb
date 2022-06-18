class Comment < ApplicationRecord
    belongs_to :author, class_name: 'User'
  belongs_to :post

  def self.update_post_comments_counter(post)
    post.update(comments_counter: Comment.where(post_id: post.id).length)
  end
end
