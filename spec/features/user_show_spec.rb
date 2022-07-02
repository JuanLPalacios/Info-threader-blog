require 'rails_helper'

RSpec.describe 'User show page', type: :feature do
  before(:example) do
    visit('/')
    fill_in('user_email', with: 'test0@test.com')
    fill_in('user_password', with: 'password')
    click_button 'Log in'
    visit('/users/1')
  end
  let (:user) { User.first }
  let (:post) { user.most_recent_posts.first }

  it '
  I can see the user\'s profile picture.
  ' do
    expect(page).to have_xpath("//img[@src = '#{user.photo}']")
  end
  
  it '
  I can see the user\'s username.
  ' do
    expect(page).to have_content(user.name)
  end
  
  it '
  I can see the number of posts the user has written.
  ' do
    expect(page).to have_content("Number of posts: #{user.posts_counter}")
  end
  
  it '
  I can see the user\'s bio.
  ' do
    expect(page).to have_content(user.bio)
  end
  
  it '
  I can see the user\'s first 3 posts.
  ' do
    user.most_recent_posts.each { |post| expect(page).to have_content(post.title) }
  end
  
  it '
  I can see a button that lets me view all of a user\'s posts.
  ' do
    expect(page).to have_content('See all posts')
  end
  
  it '
  When I click a user\'s post, it redirects me to that post\'s show page.
  ' do
    click_on(post.title)
    
    expect(page).to have_current_path(show_post_path(user, post))
  end

  it '
  When I click to see all posts, it redirects me to the user\'s post\'s index page.
  ' do
    click_link('See all posts')
    
    expect(page).to have_current_path(posts_path(user))
  end
end