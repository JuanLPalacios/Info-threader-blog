require 'rails_helper'

RSpec.describe 'User post index page', type: :feature do
  before(:example) do
    visit('/')
    fill_in('user_email', with: 'test0@test.com')
    fill_in('user_password', with: 'password')
    click_button 'Log in'
    visit('/users/1/posts')
  end
  let(:user) { User.first }
  let(:post) { user.posts.first }
  let(:comment) { post.most_recent_comments.first }

  it 'I can see the user\'s profile picture.' do
    expect(page).to have_xpath("//img[@src = '#{user.photo}']")
  end

  it 'I can see the user\'s username.' do
    expect(page).to have_content(user.name)
  end

  it 'I can see the number of posts the user has written.' do
    expect(page).to have_content("Number of posts: #{user.posts_counter}")
  end

  it 'I can see a post\'s title.' do
    expect(page).to have_content(post.title)
  end

  it 'I can see some of the post\'s body.' do
    expect(page).to have_content(post.text.truncate(200))
  end

  it 'I can see the first comments on a post.' do
    expect(page).to have_content(comment.text)
  end

  it 'I can see how many comments a post has.' do
    expect(page).to have_content("Comments: #{post.comments_counter}")
  end

  it 'How many likes a post has should be seen.' do
    expect(page).to have_button("Likes: #{post.likes_counter}")
  end

  it 'I can see a section for pagination if there are more posts than fit on the view.' do
    click_on('Next')
    expect(page).to have_current_path(posts_path(user, page: 2))
  end

  it 'When click on a post, it should redirects to that post\'s show page' do
    click_on(post.title)
    expect(page).to have_current_path(show_post_path(user, post))
  end
end
