class MessagesController < ApplicationController
  def index
    @messages = Message.all

    if params[:query].present?
      sql_query = "sender_email ILIKE :query OR model ILIKE :query"
      @messages = Message.where(sql_query, query: "%#{params[:query]}%")
    else
      @messages = Message.all
    end
  end

  def show
    @message = Message.find(params[:id])
    @label = Label.new
  end

  def destroy
    @message = Message.destroy(params[:id])
  end
end
