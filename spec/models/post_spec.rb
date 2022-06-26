require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'When creating a new user:' do
    subject { Post.new(author: User.first, title: 'Hello', text: 'This is my post') }

    before { subject.save }

    it 'Should verify name must not be blank.' do
      subject.title = ''
      expect(subject).to_not be_valid
    end

    it 'Should verify likes_counter must be an integer greater than or equal to zero.' do
      subject.likes_counter = -1
      expect(subject).to_not be_valid
    end

    it 'Should verify comments_counter must be an integer greater than or equal to zero.' do
      subject.comments_counter = -1
      expect(subject).to_not be_valid
    end
  end

  context 'update_user_posts_counter method for a given post:' do
    it 'Should update the author posts_counter' do
      post = Post.create(author: User.first, title: 'Hello', text: 'This is my post')
      post.update_user_posts_counter

      expect(User.first.posts_counter).to eq(User.first.posts.length)
    end
  end

  context 'most_recent_posts method for a given post:' do
    subject { Post.find(1) }

    it 'Should return 5 most recent comments' do
      result = subject.most_recent_comments

      expect(result.length).to eq(5)
      expect(result).to include(subject.comments.last)
    end
  end
end
