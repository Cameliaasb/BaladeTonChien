class ChatroomsController < ApplicationController
  before_action :authenticate_user!
  # It is created when both users swiped positively on each other

  def show
    # a conversation with another owner
    @chatroom = Chatroom.find(params[:id])

    # @user is the other owner
    @user = @chatroom.first_user == current_user ? @chatroom.second_user : @chatroom.first_user

    # Input section to send new messages
    @message = Message.new
    @messages = @chatroom.messages.order(:created_at)
  end

  def index
    # All chatrooms unlocked by current_user
    @chatrooms = Chatroom.where('first_user_id = ? OR second_user_id = ?', current_user.id, current_user.id)
  end
end
