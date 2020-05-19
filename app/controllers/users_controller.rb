class UsersController < ApplicationController
  def edit
  end

  def upadate
    if current_user.upadate(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :gender, :profile, :icon)
  end
end