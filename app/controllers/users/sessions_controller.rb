class Users::SessionsController < Devise::SessionsController
  respond_to :json
  protect_from_forgery with: :null_session

  private

  def respond_with(_resource, _opts = {})
    render json: { token: request.env['warden-jwt_auth.token'] }, status: :ok
  end
end
