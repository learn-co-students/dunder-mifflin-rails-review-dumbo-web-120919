class DogsController < ApplicationController
    before_action :find_dog, only: [:show, :edit, :update]

    def index
        @dogs = Dog.all
    end

    def new
        @dog = Dog.new
    end

    def create 
        @dog = Dog.create(dog_params)
        redirect_to dog_path(dog.id)
    end

    def show
    end

    def edit
    end

    def update
    end


    private 

    def dog_params
        params.require(:dog).permit( :name, :breed, :age)
    end 

    def find_dog
        @dog = Dog.find(params[:id])
    end 
end
