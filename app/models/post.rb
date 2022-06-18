class Post < ApplicationRecord
    belongs_to :author, class_name: 'User'
    has_many :comments
    has_many :likes
    
    def self.update_user_posts_counter(user)
        user.update(post_counter: Post.where(author_id: user.id).length)
    end

    def most_recent_comments
      self.comments.order(created_at: :desc).limit(5)
    end
end
