require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
  before(:example) do
    visit('/')
    fill_in('user_email', with: 'test0@test.com')
    fill_in('user_password', with: 'password')
    click_button 'Log in'
    visit('/users')
  end
  let (:users) { User.all }

  it 'I can see the username of all other users.' do
    users.each { |user| expect(page).to have_content(user.name) }
  end
  
  it 'I can see the profile picture for each user.' do
    users.each { |user| expect(page).to have_xpath("//img[@src = '#{user.photo}']") }
  end

  it 'I can see the number of posts each user has written.' do
    users.each { |user| expect(page).to have_content("Number of posts: #{user.posts_counter}") }
  end

  it 'When I click on a user, I am redirected to that user\'s show page.' do
    click_on(users.first.name)

    expect(page).to have_current_path(show_user_path(users.first))
  end
end