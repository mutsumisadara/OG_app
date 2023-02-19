class UsersController < ApplicationController
  
  def show
    @group = Group.find(params[:id])
    @user = User.find(params[:id])
    @user = current_user
  end
end