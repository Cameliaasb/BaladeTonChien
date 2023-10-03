class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    unless @message.content.scan(/(.*)(http\S*)(.*)/).empty?
      content = @message.content.scan(/(.*)(http\S*)(.*)/).first.map do |el|
        el.include?('http') ? "<a href=#{el} class='text-dark'>#{Walk.find(el.scan(/walks\/(\d*)/).join()).title}</a>" : el
      end.join
    else
      content = @message.content
    end
    @message.content = content
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        { message: @message, user: current_user }
      )
      head :ok
    else
      render "chatrooms/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
