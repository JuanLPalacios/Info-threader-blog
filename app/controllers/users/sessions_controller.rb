class Users::SessionsController < Devise::SessionsController
  respond_to :json
  protect_from_forgery with: :null_session

  private

  def respond_with(resource, _opts = {})
    render json: {token: request.env['warden-jwt_auth.token']}, status: :ok
  end

  def respond_to_on_destroy
    head :ok
  end
end
