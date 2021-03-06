class UsersController < ApplicationController
#  before_action :logged_in_user, only: [:edit, :update, :index, :show]
#  before_action :correct_user, only: [:edit, :update, :show]

  def index
    @users = User.all
#    redirect_to root_url
    respond_to do |format|
      format.html
      format.json {render json: {"error" => false, "message" => "",
	"users" => @users} }
    end
  end

  def new
    @user = User.new
    @title = "Register"
  end

  def show
    @user = User.find(params[:id])
    @title = @user.firstName + " " + @user.lastName
    respond_to do |format|
      format.html
#      format.json {render json: @user }
      format.json {render json: {"error" => false, "message" => "",
	"id" => @user.id,
	"firstName" => @user.firstName,
	"lastName" => @user.id,
	"email" => @user.lastName} }
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Your information is saved..."
      redirect_to @user
#      redirect_to :action => 'show'
    else
      @title = "Register"
      render :new
    end
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end

  private
    ## Strong Parameters
    def user_params
      params.require(:user).permit(:firstName, :lastName, :email,
                                   :password, :password_confirmation)
    end

    # Before filters

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

end
