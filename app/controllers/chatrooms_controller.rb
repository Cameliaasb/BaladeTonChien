class ChatroomsController < ApplicationController
  before_action :authenticate_user!
  # It is created when both users swiped positively on each other

  def show
    @chatroom = Chatroom.find(params[:id])
    @user = @chatroom.users.reject { |user| user == current_user }.first
    @message = Message.new
    @messages = @chatroom.messages.order(:created_at)
  end

  def index
    @chatrooms = Chatroom.all.select { |chat| chat.users.include?(current_user) }
  end
end
