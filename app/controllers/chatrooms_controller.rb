class ChatroomsController < ApplicationController
  before_action :authenticate_user!
  # It is created when both users swiped positively on each other

  def show
    @chatroom = Chatroom.find(params[:id])
    @user = @chatroom.first_user == current_user ? @chatroom.second_user : @chatroom.first_user
    @message = Message.new
    @messages = @chatroom.messages.order(:created_at)
  end

  def index
    @chatrooms = Chatroom.where('first_user_id = ? OR second_user_id = ?', current_user.id, current_user.id)
  end
end
