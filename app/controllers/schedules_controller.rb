class SchedulesController < ApplicationController

  def index
    @group = Group.find(params[:group_id])
    @schedules = Schedule.where(group_id: @group)
  end

  def new
    @schedule = Schedule.new
    @group = Group.find(params[:group_id])
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.group_id = current_user.group_id
    if @schedule.save
      redirect_to schedules_path(group_id: @schedule.group_id), notice: 'スケジュールを追加しました'
    else
      flash.now[:alert] = '失敗しました'
      render :new
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def update
    set_schedule
    @schedule.update(schedule_params)
      redirect_to schedules_path(group_id: current_user.group_id), notice: '更新しました'
  end

  def edit
    set_schedule
  end

  def destroy
    set_schedule
    @schedule.destroy
      redirect_to schedules_path(group_id: @schedule.group_id), notice: '削除しました'
  end

  private

  def schedule_params
    params.require(:schedule).permit(:id, :content, :start_time, :group_id)
  end

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end
end