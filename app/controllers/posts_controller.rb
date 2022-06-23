class PostsController < ApplicationController
  def index
    params['page'] = 1 if params['page'].nil? || ((params['page'].to_i < 1))
    @user = User.find(params['user_id'].to_i)
    @posts = @user.posts.limit(2).offset((params['page'].to_i - 1) * 2)
    @page = params['page'].to_i
  end

  def show
    @post = Post.find(params['id'].to_i)
    @comment = Comment.new()
  end

  def new
    @post = Post.new()
  end

  def create
    params['author'] = ApplicationRecord.current_user
    @post = Post.create(author: ApplicationRecord.current_user, title: params['title'], text: params['text'])
    redirect_to show_post_path(@post.author, @post)
  end

  def comment
    @post = Post.find(params['id'].to_i)
    comment = Comment.create(author: ApplicationRecord.current_user, post_id: params['id'].to_i, text: params['text'])
    comment.update_post_comments_counter
    redirect_to show_post_path(@post.author, @post)
  end

  def like
    @post = Post.find(params['id'].to_i)
    like = Like.create(author: ApplicationRecord.current_user, post_id: params['id'].to_i)
    like.update_likes_counter
    redirect_to show_post_path(@post.author, @post)
  end

end
