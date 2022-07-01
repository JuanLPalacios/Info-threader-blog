class PostsController < ApplicationController
  def index
    params['page'] = 1 if params['page'].nil? || ((params['page'].to_i < 1))
    @user = User.find(params['user_id'].to_i)
    @posts = Post
      .includes(:comments, comments: [:author])
      .where(author_id: params['user_id'].to_i).limit(2).offset((params['page'].to_i - 1) * 2)
    @page = params['page'].to_i
  end

  def show
    @post = Post.find(params['id'].to_i)
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    params['author'] = current_user
    @post = Post.create(author: current_user, title: params['title'], text: params['text'])
    return redirect_to show_post_path(@post.author, @post) if @post.valid?

    render 'new'
  end

  def delete
    post = Post.find(params['id'].to_i)
    author = post.author
    post.delete
    redirect_to posts_path(author)
  end

  def like
    @post = Post.find(params['id'].to_i)
    like = Like.create(author: current_user, post_id: params['id'].to_i)
    like.update_likes_counter
    redirect_to show_post_path(@post.author, @post)
  end
end
