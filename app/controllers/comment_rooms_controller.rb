class CommentRoomsController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @comment_rooms = CommentRoom.where(group_id: @group)
    # @comment_rooms = CommentRoom.includes(group: :users)
    @comment_room = CommentRoom.new
  end

  def new
    @comment_room = CommentRoom.new
    @group = Group.find(params[:group_id])
  end

  def create
    @comment_room = CommentRoom.new(comment_room_params)
    @comment_room.group_id = current_user.group_id
    respond_to do |format|
      if @comment_room.save
        format.html { redirect_to comment_rooms_url(group_id: @comment_room.group_id) }
        format.json { redirect_to comment_rooms_url(group_id: @comment_room.group_id) }
      else
        format.html { redirect_to comment_rooms_url(group_id: @comment_room.group_id), notice: '投稿できませんでした' }
        # format.json { render json: @comment_room.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    set_params
  end

  def show
    set_params
    @group = Group.find(params[:group_id])
    @comment_rooms = CommentRoom.where(group_id: @group)
  end

  def update
    set_params
    @comment_room.group_id = current_user.group_id
    respond_to do |format|
    if @comment_room.update(set_params.attributes)
      format.html { redirect_to comment_rooms_url(group_id: @comment_room.group_id), notice: 'チャットを更新しました' }
      format.json { redirect_to comment_rooms_url(group_id:current_user.group_id), notice: 'チャットを更新しました' }
    else
      format.html { redirect_to comment_rooms_url(group_id: current_user.group_id), notice: '更新できませんでした' }
      end
    end
  end

  def destroy
    @comment_room = CommentRoom.find(params[:id])
    @comment_room.destroy
      redirect_to comment_rooms_path(group_id: current_user.group_id), notice: 'チャットを削除しました'
  end

  private
  def comment_room_params
    params.require(:comment_room).permit(:content)
  end

  def set_params
    @comment_room = CommentRoom.find(params[:id])
  end
end