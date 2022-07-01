class CommentsController < ApplicationController
  def create
    @post = Post.find(params['id'].to_i)
    comment = Comment.create(author: current_user, post_id: params['id'].to_i, text: params['text'])
    comment.update_post_comments_counter
    redirect_to show_post_path(@post.author, @post)
  end

  def delete
    comment = Comment.find(params['id'].to_i)
    post = comment.post
    comment.delete
    redirect_to show_post_path(post.author, post)
  end
end
