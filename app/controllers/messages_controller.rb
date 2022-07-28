class MessagesController < ApplicationController
  before_action :set_room, only: %i[new create edit update]

  def new
    @message = @room.messages.new
  end

  def create
    @message = @room.messages.create(message_params)

    respond_to do |format|
      format.html { redirect_to @room }
    end
  end

  def edit
    @message = @room.messages.find(params[:id])
  end

  def update
    @message = @room.messages.find(params[:id])

    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to room_message_url(@room, @message), notice: "Room was successfully updated." }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end

    end
  end

  private
  
  def set_room
    @room = Room.find(params[:room_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end