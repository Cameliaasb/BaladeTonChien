class DogsController < ApplicationController
  before_action :authenticate_user!

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.user = current_user
    if @dog.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def mydog
    @dog = current_user.dog
  end

  private

  def dog_params
    # all boolean params are set to false by default
    params.require(:dog).permit(
      :name, :breed, :age, :energy, :size, :neutered, :sexe, :photo,
      :neutered_males, :neutered_females, :unneutered_females, :unneutered_males,
      :big_dogs, :small_dogs
    )
  end
end
