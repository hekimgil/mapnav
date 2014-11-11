class UsersController < ApplicationController
  def new
    @user = User.new
    @title = "Register"
  end

  def show
    @user = User.find(params[:id])
    @title = @user.firstName + " " + @user.lastName
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Your information is saved..."
#      redirect_to @user
      redirect_to :action => :show
    else
      @title = "Register"
      render :new
    end
  end

  private
  ## Strong Parameters
  def user_params
    params.require(:user).permit(:firstName, :lastName, :email)
  end
end
