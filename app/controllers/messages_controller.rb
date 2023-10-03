class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @message = Message.new(message_params)
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message.chatroom = @chatroom
    @message.user = current_user

    # if the message is a link for a walk, it renders the walk title
    if @message.content.scan(/(.*)(http\S*walk)(.*)/).empty?
      content = @message.content
    else
      content = @message.content.scan(/(.*)(http\S*)(.*)/).first.map do |el|
        el.include?('http') ? "<a href=#{el} class='text-dark'>#{Walk.find(el.scan(/walks\/(\d*)/).join()).title}</a>" : el
      end.join
    end
    @message.content = content

    # The msg is sent if attributes are valid (content, user, chatroom)
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
