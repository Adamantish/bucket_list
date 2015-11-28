class HomeController < ApplicationController

  include ApplicationHelper

  def index
    @edit_or_new_to_do = ToDo.new()
    @destination_options = get_select_options(Destination.all)
    # TODO: Remove next line and instead enable prompt
    @destination_options.unshift(["",0])
    @to_dos = ToDo.all
    @to_dos_json = @to_dos.to_json(except: %i(id, created_at, updated_at))
  end


end