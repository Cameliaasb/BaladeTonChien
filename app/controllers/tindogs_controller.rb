class TindogsController < ApplicationController
  before_action :authenticate_user!

  def index
    # All dogs swiped positively
    tindogs_ids = current_user.dog.tindogs.pluck(:receiver_id)
    # All dogs that are neither user's own dog or that were swiped
    @dogs = Dog.where.not(id: tindogs_ids.push(current_user.dog.id))

    @mydog = Dog.find(current_user.dog.id)
  end

  def create
    @tindog = Tindog.new(tindog_params)
    @tindog.sender_id = current_user.dog.id
    @tindog.save

    # checks if the other "dog" has also swiped possively, if yes a chatroom is created
    if match(@tindog)
      @chatroom = Chatroom.create(first_user: @tindog.receiver.user, second_user: @tindog.sender.user)
      render partial: "chatrooms/its_a_match", locals: { tindog: @tindog, chatroom: @chatroom }, formats: :html
    end
  end

  def match(tindog)
    Tindog.where(
      receiver_id: tindog.sender_id,
      sender_id: tindog.receiver_id
    ).any?
  end

  private

  def tindog_params
    params.require(:tindog).permit(:receiver_id)
  end
end
