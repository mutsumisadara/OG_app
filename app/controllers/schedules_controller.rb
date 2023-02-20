class SchedulesController < ApplicationController

  def index
    @group = Group.find(params[:group_id])
    @schedules = Schedule.where(group_id: @group.id)
    # @schedules = Schedule.where(group_id: current_user.group_id)
  end

  def new
    @schedule = Schedule.new
    @group = Group.find(params[:group_id])
    # createできたらgroup_id入っているか要確認
  end

  def create
    # @schedule = current_user.group_id.schedules.build(schedule_params)
    @schedule = Schedule.new(schedule_params)
    @schedule.group_id = current_user.group_id
    if @schedule.save
      redirect_to group_path(@schedule.group_id), notice: 'スケジュールを追加しました'
    else
      redirect_to schedules_path, notice: '失敗しました'
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def update
    set_schedule
    @schedule.update(schedule_params)
      redirect_to schedules_path, notice: '更新しました'
  end

  def edit
    set_schedule
  end

  def destroy
    set_schedule
    @schedule.destroy
      redirect_to schedules_path, notice: '削除しました'
  end

  private

  def schedule_params
    params.require(:schedule).permit(:id, :content, :start_time, :group_id)
  end

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end
end