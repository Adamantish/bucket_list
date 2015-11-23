class HomeController < ApplicationController

  def index
    @to_do_json = ToDo.all.to_json(except: %i(id, created_at, updated_at))
  end

end