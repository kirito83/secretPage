class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user == current_user
      new_user = session_params
      if @user.update(new_user)
        redirect_to users_path
      else
        redirect_to edit_path
      end
    else
      flash[:danger] = "Ce n'est pas votre profil, vous ne pouvez pas le modifier"
      redirect_to edit_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user == current_user
      @user.destroy
      redirect_to users_path
    else
      flash[:danger] = "Ce n'est pas votre profil, vous ne pouvez pas le supprimer"
      redirect_to user_path(@user.id)
    end
  end

  private
    def session_params
      params.require(:user).permit(:username, :email, :password)
    end
end
