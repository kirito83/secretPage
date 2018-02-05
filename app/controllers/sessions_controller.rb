class SessionsController < ApplicationController
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

  def login
  end

  def create_login
  	user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email or password' # Not quite right!
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user == current_user
      new_user = session_params
      if user.update(new_user)
        redirect_to user_path(user.id)
      else
        render '/sessions/<%=params[:id]%>/edit'
      end
    else
      flash.now[:danger] = "Ce n'est pas votre profil, vous ne pouvez pas le modifier"
      render '/sessions/<%=params[:id]%>/edit'
    end
  end

  private
    def session_params
      params.require(:session).permit(:username, :email, :password)
    end
end
