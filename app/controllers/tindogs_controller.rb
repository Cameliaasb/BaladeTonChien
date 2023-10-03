class TindogsController < ApplicationController
  before_action :authenticate_user!

  def index
    tindogs_ids = current_user.dog.tindogs.pluck(:receiver_id)
    @dogs = Dog.where.not(id: tindogs_ids.push(current_user.dog.id))
    @mydog = Dog.find(current_user.dog.id)
  end

  def create
    @tindog = Tindog.new(tindog_params)
    @tindog.sender_id = current_user.dog.id
    @tindog.save

    if match(@tindog)
      @chatroom = Chatroom.create(first_user: @tindog.receiver, second_user: @tindog.sender)
r      @message = Message.create(user: current_user, content: "🦴🥎", chatroom: @chatroom)
      @message = Message.create(user: Dog.find(@tindog.receiver_id).user, content: "🐾🌳", chatroom: @chatroom)
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
