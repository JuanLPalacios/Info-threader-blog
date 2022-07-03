class Users::SessionsController < ActionController::API
  respond_to :json
  before_action :authenticate_user!

  def index
    render json: Comment.where(post_id: params['post_id'].to_i)
  end

  def create
    comment = Comment.create(author: current_user, post_id: params['post_id'].to_i, text: params['text'])
    comment.update_post_comments_counter
    render json: comment
  end
end
