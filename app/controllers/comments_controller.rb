class CommentsController < ApplicationController
  # before_action :set_comment_room, only: [:create, :edit, :update]

  def index
    @comments = Comment.all
    @comment = Comment.new
    @comment.comment_room_id = params[:comment_room_id]
  end

  # def show
  #   @comment = Comment.find(params[:id])
  #   # binding.pry
  #   #show要らない
  # end

  # def create
  #   @comment_room = CommentRoom.find(params[:comment_room_id])
  #   @comment = @comment_room.comments.build(comment_params)
  #   respond_to do |format|
  #     if @comment.save
  #       format.html { redirect_to comment_rooms_path(@comment_room) }
  #     else
  #       format.html { redirect_to comment_rooms_path(@comment_room), notice: '投稿できませんでした...' }
  #     end
  #   end
  # end
  def create
    # binding.pry
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to comments_url, notice: "投稿されました" }
        format.json { redirect_to comments_url, notice: "投稿されました" }
        # format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @comment = @comment_room.comments.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = 'コメントの編集中'
      format.js { render :edit }
    end
  end

  def update
    @comment = @comment_room.comments.find(params[:id])
      respond_to do |format|
        if @comment.update(comment_params)
          flash.now[:notice] = 'コメントが編集されました'
          format.js { render :index }
        else
          flash.now[:notice] = 'コメントの編集に失敗しました'
          format.js { render :edit }
        end
      end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      flash.now[:notice] = 'コメントが削除されました'
      format.js { render :index }
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:id, :content)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_comment_room
    @comment_room = CommentRoom.find(params[:comment_room_id])
    # これでok
  end
end