require 'rails_helper'

RSpec.describe Like, type: :model do
  context 'update_likes_counter method for a given post:' do
    it 'Should update the post likes_counter' do
      like = Like.create(author: User.first, post: Post.first)
      like.update_likes_counter

      expect(Post.first.likes_counter).to eq(Post.first.likes.length)
    end
  end
end
