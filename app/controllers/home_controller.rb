class HomeController < ApplicationController

  include ApplicationHelper

  def index
    @todo = ToDo.new()
    @destination_options = get_select_options(Destination.all)
    @destination_options.unshift(["",0])
    @to_do_json = ToDo.all.to_json(except: %i(id, created_at, updated_at))
  end


end