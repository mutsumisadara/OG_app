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
    @group = Group.find(params[:id])
    # redirect_to groups_path, 
    # notice: '属していません' unless current_user.group_id == @group.id
    redirect_to groups_path, notice: '属していません' unless @group.users.include?(current_user)
  end

  def create
    @group = Group.new(group_params)
    @group.owner = current_user
    if @group.save
      redirect_to groups_path, notice: 'グループを作成しました'
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    @user = User.find_by(email: params[:group][:email])

    # @user = User.find_by(invite_user_email)
    # @user = User.find_by(params[:group][:email])
    # @user.group_id << current_user.group_id
    @user.group_id = current_user.group_id
    # binding.pry
    # @user = @user.group_id
    # @user.group_id.update!
    # binding.pry
    # if @group.update(group_params)
    #   redirect_to @group, notice: 'グループを更新しました'
    # if @user.group_id.update_attribute(group_id: @user.group_id)
    # if @user.group_id.update(:group_id)
    
    # else
      if @user.update(group_id: @user.group_id)
      # redirect_to @group, notice: "#{@user.name}を招待しました" and return
      redirect_to @group, notice: "#{@user.name}を招待しました"
      # flash.now[:notice] = 'メンバーを招待しました'
      # render :index
    # else
    #   flash.now[:alert] = '失敗しました'
    #   render :show
      # end
    end
  end

  def destroy
    @group = Group.find(params[:id])
    if @group.destroy
      redirect_to groups_path, notice: 'グループを削除しました'
    end
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

  private
  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:id, :name)
      # (:id, :name, user_ids:[]), user_ids:[], animal_ids:[]
  end

  # def invite_user_email
  #   params.require(:group).permit(columns_attributes: [:email])
  # end
end