class UsersController < ApplicationController
  def new
    @user = User.new
    @title = "Register"
  end

  def show
    @user = User.find(params[:id])
    @title = @user.firstName + " " + @user.lastName
    respond_to do |format|
      format.html
      format.json {render json: @user }
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
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
end
