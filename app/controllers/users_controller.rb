class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end


  def update
    @user =  current_user
    user_params =  params.require(:user).permit(:firstname, :lastname, :email, :adress)
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
end