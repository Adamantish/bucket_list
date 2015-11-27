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
    @to_do = ToDo.find(params["id"])
    @to_do.travellers << current_traveller
    @likes = @to_do.likes.count
    render partial: 'liked'
  end

  def delete_like

  end

  def search
    @to_dos = ToDo.where("description LIKE ?", "%#{params[:search]}%")
    render json: @to_dos
    # respond_to do 
      
    # end
  end

  private

  def sane_params
     params.require(:to_do).permit(:destination_id, :description, :address)
  end

end
