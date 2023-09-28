class DogsController < ApplicationController
  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    if @dog.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def mydog
    @dog = current_user.dog
  end

  def update
    # pouvoir récupérérer ce qui se passe dans le formulaire du dog profile
  end

  private

  def dog_params
    params.require(:dog).permit(
      :name, :breed, :age, :energy, :neutered_males, :neutered_females, :size,
      :neutered, :sexe, :photo, :unneutered_females, :unneutered_males
    )
  end
end
