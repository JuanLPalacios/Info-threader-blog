class Api::PostsController < ActionController::API
  respond_to :json
  before_action :authenticate_user!

  def index
    render json: Post.where(author_id: params['author_id'].to_i)
  end
end
