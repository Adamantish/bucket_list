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
    @edited_to_do = ToDo.update(id, sane_params)
    render partial: 'edited'
  end

  def destroy
    ToDo.destroy(params["id"].to_i)
    render text: ""
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
    # This parameter needs sanitising with a gem like Sequel .
    @search_results = ToDo.includes(:destination).joins(:destination).where("description LIKE ?", "%#{params[:search]}%")
    
    @results_a = []
    @search_results.each do |obj|
      h = obj.attributes
      h["destination_name"] = obj.destination.name
      @results_a << h
    end

    @numOfSearchResults = @search_results.count == 0 ? "" : @search_results.count

    respond_to do |format|
      format.json {render json: @results_a}
      format.html do

        #This is copy paste of the index controller. 
        #Have yet to figure out how to DRY up and redirect to it with a payload of search results.
        #A bit of technical debt here.
          @edit_or_new_to_do = ToDo.new()
          @destinations = Destination.all
          @destination_options = get_select_options(@destinations)
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
