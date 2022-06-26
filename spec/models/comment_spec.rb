require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'update_post_comments_counter method for a given post:' do
    it 'Should update the post comments_counter' do
      comment = Comment.create(post: Post.first, author: User.first, text: 'comment')
      comment.update_post_comments_counter

      expect(Post.first.comments_counter).to eq(Post.first.comments.length)
    end
  end
end
