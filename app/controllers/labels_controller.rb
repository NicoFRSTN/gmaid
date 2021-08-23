class LabelsController < ApplicationController
  def new
    @label = Label.new
  end

  def create
    @label = Label.new(label_params)
    if @lable.save
      redirect_to labels_path
    else
      render :new
    end
  end

  def edit
    @label = Label.find(params[:id])
  end

  def update
    @label = Label.find(params[:id])

    if @label.update(label_params)
      redirect_to @label, notice: "You'r label are update with success !"
    else
      render :edit
    end
  end

  def destroy
    @label = Label.destroy(params[:id])
    redirect_to message_path
  end

  private

  def label_params
    params.require(:label).permit(:name)
  end
end
