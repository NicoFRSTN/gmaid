class LabelsController < ApplicationController
  def new
    @label = Label.new
  end

  def create
    @label = Label.new(label_params)
    @message = Message.find(params[:message_id])
    @label.message = @message

    if @label.save
      redirect_to message_path(@message.id)
    else
      render :new
    end
  end

  def edit
    @message = Message.find(params[:message_id])
    @label = Label.find(params[:id])
  end

  def update
    @label = Label.find(params[:id])
    @message = Message.find(params[:message_id])
    @label.message = @label
    if @label.update(label_params)
      redirect_to message_path(@label.message)
    else
      render :show
    end
  end

  def destroy
    @label = Label.find(params[:id])
    @label.destroy
    redirect_to message_path(@label.message)
  end

  private

  def label_params
    params.require(:label).permit(:name)
  end
end
