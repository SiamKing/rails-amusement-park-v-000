class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    if user && user.authenticate(params[:user][:password])
      log_in user
      flash[:success] = "Welcome back to the park!"
      redirect_to user
    else
      flash.now[:danger] = "Invalid name/password combination"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end
end
