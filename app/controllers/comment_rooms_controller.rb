class CommentRoomsController < ApplicationController
  def index
    @comment_rooms = CommentRoom.all
    @comment_room = CommentRoom.new
    @comment_room.group_id = current_user.group_id
    # binding.pry
  end

  def new
    @comment_room = CommentRoom.new
  end

  def create
    # binding.pry
    @comment_room = CommentRoom.new(comment_room_params)
    @comment_room.group_id = current_user.group_id
    respond_to do |format|
      if @comment_room.save
        format.html { redirect_to comment_rooms_url }
        format.json { redirect_to comment_rooms_url }
        # format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @comment_room.errors, status: :unprocessable_entity }
      end
    end
  end


  def show
    # @comments = Comment.all
    set_params
    # @comments = @comment_room.comments
    # @comment = @comment_room.comments.build
      # binding.pry
  end

  private
  def comment_room_params
    params.require(:comment_room).permit(:id, :content)
  end

  def set_params
    @comment_room = CommentRoom.find(params[:id])
  end
end
