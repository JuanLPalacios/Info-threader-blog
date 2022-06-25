# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
5.times do |i|
  User.create(name: "User #{i}", photo: "https://picsum.photos/id/#{i+1004}/576/384", bio: "User #{i} from test batch", posts_counter:0)
end

5.times do |i|
  post = Post.create(author: User.first, title: "Hello ##{i}", text: "This is my post #{i}")
  post.update_user_posts_counter
end

10.times do |i|
  comment = Comment.create(post: Post.first, author: User.first, text: "comment #{i}" )
  comment.update_post_comments_counter
end