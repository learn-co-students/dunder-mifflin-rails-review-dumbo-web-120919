class DogsController < ApplicationController
    before_action :find_dog, only: [:show, :create, :edit, :update]
    before_action :dog_params, only: [:create, :update]

    def index
        @dogs = Dog.all
    end

    def new
    end

    def show
    end

    def create
    end

    def edit
    end

    def update
    end

    private

    def find_dog
        @dog = Dog.find(params[:id])
    end

    def dog_params
        params.require(:dog).permit(:name, :breed, :age)
    end
end
