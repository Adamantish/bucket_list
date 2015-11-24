class ToDosController < ApplicationController

  
  def create
    # My TODO: setup flash messaging
    @new_to_do = ToDo.create(sane_params)
    @new_to_do_json = [@new_to_do].to_json(except: %i(id, created_at, updated_at))
    # redirect_to root_path
    # render :js
  end

  private

  def sane_params
     params.require(:to_do).permit(:destination_id, :description, :address)
  end

end
