class RoomsController < ApplicationController
  def new
  end

  def create
    @room = Room.new room_params
    if @room.save
      flash[:success] = 'Congrat! Your room has created.'
      redirect_to root_path
    else
      flash[:error] = 'There are some errors when create room, please try again.'
      render 'new'
    end
  end

  def show
    @room = Room.find(params[:id])
    redirect_to room_messages_path(@room)
  end

  private

  def room_params
    params.require(:room).permit(:name)
  end
end
