class MessagesController < ApplicationController
  def index
    @messages = Message.where(room_id: params[:room_id])
    @room = Room.find(params[:room_id])

    respond_to do |format|
      format.html
      format.json {render json: @messages}
    end
  end

  def new
  end

  def create
    @room = Room.find(params[:room_id])
    @message = Message.new message_params
    @message.room_id = @room.id

    if @message.save
      flash[:success] = 'Send message successfully.'
      redirect_to room_messages_path(@room)
    else
      flash[:error] = @message.errors.full_messages.to_sentence 
      redirect_to room_messages_path(@room)
    end
  end

  private

  def message_params
    params.require(:message).permit(:username, :content)
  end
end
