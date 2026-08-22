# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
respond_to :json

  skip_before_action :require_no_authentication


  def current_token
    request.env["warden-jwt_auth.token"]
  end

  private
  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: {
        status: { code: 200, message: "Signed in successfully"  },
        data: { user: resource, jwt: JWT.encode(request.headers["Authorization"].split(" ")[1], Rails.application.credentials.fetch(:secret_key_base)) }
      }, status: :ok
    end
  end

  def respond_to_on_destroy(*)
    jwt_payload = JWT.decode(request.headers["Authorization"].split(" ")[1] || "", Rails.application.credentials.fetch(:secret_key_base)).first
    current_user = User.find(jwt_payload["sub"])

    # debugger
    if current_user
      render json: { status: { code: 200, message: "Signed out successfully" } }, status: :ok
    else
      render json: { status: { code: 401, message: "Unauthorized" } }, status: :unauthorized
    end
  end
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
