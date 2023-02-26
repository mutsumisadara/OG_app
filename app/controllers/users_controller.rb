class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
      redirect_to user_path(@user.id), notice: 'ユーザー情報を更新しました'
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

  private
  def user_params
    params.require(:user).permit(:id, :name, :email, :encrypted_password)
  end

  def set_user
    @schedule = Schedule.find(params[:id])
  end
end