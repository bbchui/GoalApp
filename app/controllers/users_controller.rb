class UsersController < ApplicationController

  def index
    render :index
  end

  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      redirect_to users_url
    else
      flash[:errors] = "Please enter valid params"
      redirect_to new_user_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
