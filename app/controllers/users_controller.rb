class UsersController < ApplicationController
  def home
  end

  def new
    @user = User.new
    @submit = "Create User"
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    if logged_in?
      current_user
    else
      redirect_to '/'
    end
  end

  def edit
    @user = current_user
    @submit = "Edit User"
  end

  def update
    @user = current_user
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :happiness, :nausea, :tickets, :height, :admin)
  end
end
