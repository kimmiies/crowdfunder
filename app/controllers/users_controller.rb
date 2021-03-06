class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]


  def show
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to projects_path
    else
      render :new
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
