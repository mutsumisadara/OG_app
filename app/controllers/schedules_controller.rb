class SchedulesController < ApplicationController
  
  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def create
    if @schedule.save(schedule_params)
      redirect_to schedules_path, notice: 'スケジュールを追加しました'
    else
      redirect_to schedules_path, notice: '失敗しました'
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def update

  end

  def edit

  end

  def destroy

  end

  private

  def schedule_params
    params.require(:schedule).permit(:id, :content, :start_time)
  end
end
