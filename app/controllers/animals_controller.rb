class AnimalsController < ApplicationController

    def index
    end

    def new
        @animal = Animal.new
    end

    def create
        # binding.pry
        @group = current_user.group_id
        @animal = Animal.new(animal_params)       
        if @animal.save!
          redirect_to group_path(@group), notice: '天使を作成しました'
          unless
            @animal = nil
          end
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
        @group = current_user.group_id
        @animal = Animal.find(params[:id])
        @animal.update(animal_params)
          redirect_to group_path(@group), notice: '天使を更新しました'
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