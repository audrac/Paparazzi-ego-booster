class UsersController < ApplicationController
  before_action :user_params, only: :destroy

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)


  private

  def user_params
    params.require(:users).permit(:user_id)
  end
end
