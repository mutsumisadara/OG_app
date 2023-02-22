class AnimalsController < ApplicationController

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)
    @animal.group_id = current_user.group_id
    if @animal.save
      redirect_to group_path(@animal.group_id), notice: '天使を作成しました'
    else
      render :new, notice:'作成に失敗しました'
    end
  end

  def show
    @animal = Animal.find(params[:id])
  end

  def edit
    @animal = Animal.find(params[:id])
  end

  def update
    @animal = Animal.find(params[:id])
    # binding.pry
    @animal.update(animal_params)
      redirect_to animal_path(@animal.id), notice: '天使を更新しました'
  end

  def destroy
    @animal = Animal.find(params[:id])
    @animal.destroy
      redirect_to group_path(@animal.group_id), notice: '天使が幸せを掴みました'
  end

  private
  def animal_params
    params.require(:animal).permit(:id, :name, :sex, :castration, :picture, :picture_cache, :birthday, :kinds, :information)
  end

  def set_animal
      @animal = Animal.find(params[:id])
  end
end