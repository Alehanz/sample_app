class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    User.create!(params[:user].permit(:name, :email, :password, :password_confirmation))
    redirect_to root_path
  end
end
