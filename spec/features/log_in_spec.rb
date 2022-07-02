require 'rails_helper'

RSpec.describe 'Login page', type: :feature do
  before(:example) do
    visit('/users/sign_in')
  end

  it 'The username and password inputs and the "Submit" button should be seen.' do
    expect(page).to have_xpath("//input[@name = 'user[email]']")
    expect(page).to have_xpath("//input[@name = 'user[password]']")
    expect(page).to have_button('Log in')
  end

  it 'When I click the submit button without filling in the username and the password, I get a detailed error.' do
    click_button 'Log in'

    expect(page).to have_content('Invalid Email or password.')
  end

  it 'When I click the submit button after filling in the username and the ' \
     'password with incorrect data, I get a detailed error.' do
    fill_in('user_email', with: 'test0@test.com')
    fill_in('user_password', with: 'wrong_password')
    click_button 'Log in'

    expect(page).to have_content('Invalid Email or password.')
  end

  it 'When I click the submit button after filling in the username and ' \
     'the password with correct data, I am redirected to the root page.' do
    user = User.new(name: 'User #0', photo: 'https://picsum.photos/id/1004/576/384', bio: 'User 0 from test batch',
                    email: 'test0@alt_test.com', password: 'password', password_confirmation: 'password')
    user.skip_confirmation!
    user.save!

    fill_in('user_email', with: 'test0@alt_test.com')
    fill_in('user_password', with: 'password')
    click_button 'Log in'

    expect(page).to have_current_path(root_path)
  end
end
