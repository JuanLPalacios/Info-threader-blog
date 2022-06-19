class PostsController < ApplicationController
  def index
    params['page'] = 1 if params['page'].nil? || ((params['page'].to_i < 1))
    @user = User.find(params['user_id'].to_i)
    @posts = @user.posts.limit(2).offset((params['page'].to_i - 1) * 2)
    @page = params['page'].to_i
  end

  def show
    @post = Post.find(params['id'].to_i)
  end

  def create
    render "show"
  end

  def comment
    render "show"
  end

  def like
    @post = Post.find(params['id'].to_i)
    like = Like.create(author: ApplicationRecord.current_user, post_id: params['id'].to_i)
    like.update_likes_counter
    redirect_to show_post_path(@post.author, @post)
  end

end
