class Users::SessionsController < Devise::SessionsController
  # skip_before_action :verify_authenticity_token

  respond_to :json
  private


  def respond_with(resource, _opts = {})
    render json: {
      data: resource, message: 'Logged in sucessfully.', success: true },
      status: :ok
  end

  def respond_to_on_destroy
    if current_user
      render json: {
        success: false,
        message: "logged out successfully"
      }, status: :ok
    else
      render json: {
        status: 401,
        message: "Couldn't find an active session."
      }, status: :unauthorized
    end
  end

  def login_failed
    debugger
  end
end
