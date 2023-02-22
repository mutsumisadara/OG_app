class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
      @groups = Group.all
  end

  def new
      @group = Group.new
  end

  def show
    if current_user.admin?      
      @group = Group.find(params[:id])
    elsif
      @group.users.include?(current_user)
    else
      redirect_to groups_path, notice: '属していません'
    end
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    if @group.save
      current_user.group_id = @group.id
      redirect_to groups_path, notice: 'グループを作成しました'
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to @group, notice: 'グループを更新しました'
    end

    @user = User.find_by(email: params[:group][:email])
    @user.group_id = current_user.group_id
    if @user.update(group_id: @user.group_id)
      redirect_to @group, notice: "#{@user.name}を招待しました"
    else
      flash.now[:alert] = '失敗しました'
      render :show
    end
  end
  
  def destroy
    @group = Group.find(params[:id])
    @group.destroy unless current_user.id == @group.owner_id #owner_idFKつけないと使えない
      redirect_to groups_path, notice: 'グループを削除しました'
  end

  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.name = "ゲストユーザー"
      user.group_id = '1'
      user.password = SecureRandom.urlsafe_base64
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  def remove_member
    @group = Group.find(params[:id])
    @user = User.find(params[:user_id])
    @user.update(group_id: nil)
    redirect_to @group, notice: "#{@user.name}をグループから削除しました"
  end

  private
  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:id, :name)
  end
end