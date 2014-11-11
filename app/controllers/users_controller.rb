class UsersController < ApplicationController
  def new
    @title = "Register"
  end

  def show
    @user = User.find(params[:id])
  end

  private
  ## Strong Parameters
  def user_params
    params.require(:user).permit(:firstName, :lastName, :email)
  end
end
