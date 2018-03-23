class DiviseController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if !verify_recaptcha(model: @user) || !@user.save
      render "new"
    end
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end