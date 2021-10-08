class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @nickname = user.nickname
    @items = user.items
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email)
  end
end
