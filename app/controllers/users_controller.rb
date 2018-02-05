class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(session_params)
    if @user.save
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user == @current_user
      new_user = session_params
      if @user.update(new_user)
        redirect_to users_path
      else
        render 'edit'
      end
    else
      flash.now[:danger] = "Ce n'est pas votre profil, vous ne pouvez pas le modifier"
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private
    def session_params
      params.require(:session).permit(:username, :email, :password)
    end
end
