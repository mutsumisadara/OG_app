class AnimalsController < ApplicationController

    def index
    end

    def new
        @animal = Animal.new
    end

    def create
        # binding.irb
        # @group = current_user
        @animal = Animal.new(animal_params)
        if @animal.save
            redirect_to groups_path, notice: '天使を作成しました'
        end
        # binding.pry
    end

    def show
        @animal = Animal.find(params[:id])
        # animal_params
        # set_animal
        # binding.irb
    end

    def edit
        @animal = Animal.find(params[:id])
    end

    def update
        @animal = Animal.find(params[:id])
        if @animal.update(animal_params)
            redirect_to groups_path, notice: '天使を更新しました'
        end
    end

    def destroy
        @animal = Animal.find(params[:id])
        if @animal.destroy
            redirect_to groups_path, notice: '天使を削除しました'
        end
    end

    private
    def animal_params
      params.require(:animal).permit(:id, :name, :sex, group_ids:[])
    end

    def set_animal
        @animal = Animal.find(params[:id])
    end
end
