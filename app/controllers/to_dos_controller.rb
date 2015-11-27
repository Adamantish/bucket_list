class ToDosController < ApplicationController

  include ApplicationHelper
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
    @search_results = ToDo.where("description LIKE ?", "%#{params[:search]}%")
    @numOfSearchResults = @search_results.count == 0 ? "" : @search_results.count

    respond_to do |format|
      format.json {render json: @search_results}
      format.html do

        #This is copy paste of the index controller. 
        #Couldn't figure out how to redirect to it with a payload of search results.
        #Url would have been very long
          @todo = ToDo.new()
          @destination_options = get_select_options(Destination.all)
          # @destination_options.unshift(["",0])
          @to_dos = ToDo.all.includes(:likes)
          @to_dos_json = @to_dos.to_json(except: %i(id, created_at, updated_at))
          
          render 'home/index'
        # For search results
            
      end
    end
  end

  private

  def sane_params
     params.require(:to_do).permit(:destination_id, :description, :address)
  end

end
