require 'rails_helper'

RSpec.describe 'Post show page', type: :feature do
  before(:example) do
    visit('/')
    fill_in('user_email', with: 'test0@test.com')
    fill_in('user_password', with: 'password')
    click_button 'Log in'
    visit('/users/1/posts/1')
  end
  let(:user) { User.first }
  let(:post) { user.posts.first }
  let(:comments) { post.comments }

  it 'I can see the post\'s title.' do
    expect(page).to have_content(post.title)
  end

  it 'I can see who wrote the post.' do
    expect(page).to have_content(user.name)
  end

  it 'I can see how many comments it has.' do
    expect(page).to have_content("Comments: #{post.comments_counter}")
  end

  it 'I can see how many likes it has.' do
    expect(page).to have_button("Likes: #{post.likes_counter}")
  end

  it 'I can see the post body.' do
    expect(page).to have_content(post.text)
  end

  it 'I can see the username of each commentor.' do
    comments.each { |comment| expect(page).to have_content(comment.author.name) }
  end

  it 'I can see the comment each commentor left.' do
    comments.each { |comment| expect(page).to have_content(comment.text) }
  end
end
