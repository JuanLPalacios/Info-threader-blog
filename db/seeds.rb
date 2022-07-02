5.times do |i|
    user = User.new(name: "User #{i}", photo: "https://picsum.photos/id/#{i+1004}/576/384", bio: "User #{i} from test batch", email:"test#{i}@test.com", password: 'password', password_confirmation: 'password')
    user.skip_confirmation!
    user.save!
end
user = User.first
5.times do |i|
    post = Post.create(author: user, title: "Hello ##{i}", text: "This is my post #{i}")
    post.update_user_posts_counter
end
post = Post.first
10.times do |i|
    comment = Comment.create(post: post, author: user, text: "comment #{i}" )
    comment.update_post_comments_counter
end 