class AnimalManagementsController < ApplicationController

  def new
    @animal_management = AnimalManagement.new
  end

  def create
    @animal_management = AnimalManagement.new(animal_management_params)
    @animal_management.animal_id = params[:animal_id]
    if @animal_management.save
      redirect_to animal_path(@animal_management.animal_id), notice: 'カルテを作成しました'
    else
      render :new, notice:'作成に失敗しました'
    end
  end

  def show
    set_animal_management
  end

  def edit
    set_animal_management
  end
  
  def update
    set_animal_management
    if @animal_management.update(animal_management_params)
      redirect_to animal_path(@animal_management.animal_id), notice: 'カルテを更新しました'
    end
  end

  def destroy
    set_animal_management
    if @animal_management.destroy
      redirect_to animal_path(@animal_management.animal_id), notice: 'カルテを削除しました'
    end
  end

  private
  def animal_management_params
    params.require(:animal_management).permit(:id, :recorded_on, :content, :temprature)
  end

  def set_animal_management
    @animal_management = AnimalManagement.find(params[:id])
  end
end