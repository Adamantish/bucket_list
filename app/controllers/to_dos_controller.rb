class ToDosController < ApplicationController

  

  def create
    ToDo.create!(sane_params)
    redirect_to root_path
  end

  # private

  def sane_params
     params.require(:to_do).permit(:destination_id, :description, :address)
  end
end
