class TindogsController < ApplicationController
  def index

    tindogs_ids = current_user.dog.tindogs.pluck(:receiver_id)
    @dogs = Dog.where.not(id: tindogs_ids.push(current_user.dog.id))
    @mydog = Dog.find(current_user.dog.id)
    # la suite n'est plus appelée
    # if dogs_to_swipe.empty?
    #  redirect_to no_swipe_path
    # else
    #  @dog = Dog.find(dogs_to_swipe.sample)
    #  @tindog = Tindog.new
    # end
  end

  def create
    @tindog = Tindog.new(tindog_params)
    @tindog.sender_id = current_user.dog.id
    @tindog.save

    if match(@tindog)
      @match = Match.create
      @message = Message.create(user: current_user, content: "🦴🥎", match: @match)
      @message = Message.create(user: Dog.find(@tindog.receiver_id).user, content: "🐾🌳", match: @match)
      render partial: "matches/its_a_match", locals: { tindog: @tindog, match: @match }, formats: :html
    end
  end

  def noswipe
  end

  def match(tindog)
    Tindog.where(
      receiver_id: tindog.sender_id,
      sender_id: tindog.receiver_id
    ).any?
  end

  # def dogs_to_swipe
  #   # récupère tout les ids de chiens
  #   dogs_id = Dog.all.to_a.map(&:id)
  #   # supprime l'id de ton chien
  #   dogs_id.delete(current_user.dog.id)
  #   # supprime l'id de tout les chiens que t'as déjà swipé positif (pending et match)
  #   Tindog.all.each do |tindog|
  #     dogs_id.delete(tindog.receiver_id) if tindog.sender_id == current_user.dog.id
  #   end

  #   return dogs_id
  # end

  private

  def tindog_params
    params.require(:tindog).permit(:receiver_id)
  end
end
