class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  validates :name, presence: { allow_blank: false, message: 'must not be blank.' }
  validates :posts_counter, comparison: { greater_than_or_equal_to: 0 }

  Roles = [ :admin , :default ]

  def most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  def is?( requested_role )
    self.role == requested_role.to_s
  end
end
