class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @user = current_user
  end

  def destroy
    @user = User.find(params[:id])
    if current_user == @user || current_user.id == @group.owner_id
    @user.destroy
      redirect_to group_path(@user.group_id), notice: "#{@user.name}を削除しました"
    else
      redirect_to group_path(@user.group_id), notice: '本人以外は消せません'
    end
  end
end