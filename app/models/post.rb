class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  validates :title, presence: { allow_blank: false, message: 'Title must not be blank.' }
  validates :likes_counter, comparison: { greater_than_or_equal_to: 0 }
  validates :comments_counter, comparison: { greater_than_or_equal_to: 0 }

  def update_user_posts_counter
    author.increment!(:posts_counter)
  end

  def most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
