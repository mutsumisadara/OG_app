class GroupsController < ApplicationController

    def index
        @groups = Group.all
    end

    def new
        @group = Group.new
    end

    def show
        @group = Group.find(params[:id])
    end

    def create
        @group = Group.new(group_params)
        if @group.save
            redirect_to groups_path, notice: 'グループを作成しました'
        end
    end

    def edit
        @group = Group.find(params[:id])
    end

    def update
        @group = Group.find(params[:id])
        if @group.update(group_params)
            redirect_to groups_path, notice: 'グループを更新しました'
        end
    end

    def destroy
        @group = Group.find(params[:id])
        if @group.destroy
            redirect_to groups_path, notice: 'グループを削除しました'
        end
    end

    private
    def set_group
        @group = Group.find(params[:id])
    end

    def group_params
        params.require(:group).permit(:id, :name, user_ids:[])
        # (:id, :name, user_ids:[])
    end
end