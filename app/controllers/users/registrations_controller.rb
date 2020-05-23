class Users::RegistrationsController < Devise::RegistrationsController
  GET /resource/sign_up
  def new
  end

  POST /resource
  def create
    super
  end
end
