class ToDosController < ApplicationController

  def create
    @new_to_do = ToDo.create(sane_params)
    @new_to_do_json = [@new_to_do].to_json(except: %i(created_at, updated_at))
    @to_dos = []; @to_dos << @new_to_do
  end

  def photos
    @to_do_id = params['id']
    @photos = ToDo.find(@to_do_id).photos
  end

  def create_like
    ToDo.find(params["id"]).travellers << current_traveller
    render partial: 'liked'
  end

  def delete_like

  end

  private

  def sane_params
     params.require(:to_do).permit(:destination_id, :description, :address)
  end

end
