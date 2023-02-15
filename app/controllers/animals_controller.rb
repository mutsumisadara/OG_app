class AnimalsController < ApplicationController

    def new
      @animal = Animal.new
    end

    def create
      # binding.pry
      @animal = Animal.new(animal_params)
      @animal.group_id = current_user.group_id
      # @animal = current_user.group_id.build(animal_params)
      binding.pry
      if @animal.save
        redirect_to group_path(@animal.group_id), notice: '天使を作成しました'
      else
        render :new, notice:'作成に失敗しました'
      # binding.pry
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
      @animal.update(animal_params)
        redirect_to group_path(@animal.group_id), notice: '天使を更新しました'
    end

    def destroy
      @animal = Animal.find(params[:id])
      @animal.destroy
        redirect_to group_path(@animal.group_id), notice: '天使を削除しました'
    end

    private
    def animal_params
      params.require(:animal).permit(:id, :name, :sex, :group_id)
    end

    def set_animal
        @animal = Animal.find(params[:id])
    end
end