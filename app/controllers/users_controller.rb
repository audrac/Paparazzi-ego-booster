class UsersController < ApplicationController
  before_action :user_params, only: :destroy

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
  end

  def destroy
    session[:user_id] = nil
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "User deleted"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:users).permit(:user_id)
  end
end
