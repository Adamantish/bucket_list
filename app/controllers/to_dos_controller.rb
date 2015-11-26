class ToDosController < ApplicationController

  include ApplicationHelper

  def create
    @new_to_do = ToDo.create(sane_params)
    @new_to_do_json = [@new_to_do].to_json(except: %i(created_at, updated_at))
    @to_dos = []; @to_dos << @new_to_do
  end

  def edit
    @destination_options = get_select_options(Destination.all)
    @edit_or_new_to_do = ToDo.find(params["id"])
  end

  def update
    id = params["to_do"]["id"]
    ToDo.update(id, sane_params)
  end

  def photos
    @to_do_id = params['id']
    @photos = ToDo.find(@to_do_id).photos
  end

  private

  def sane_params
     params.require(:to_do).permit(:destination_id, :description, :address)
  end


end
