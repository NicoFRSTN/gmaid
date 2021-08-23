class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def show
    @message = Message.find(params[:id])
  end

  def destroy
    @message = Message.destroy(params[:id])
  end
end
