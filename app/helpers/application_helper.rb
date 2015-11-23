module ApplicationHelper

  def get_select_options(collection)
    collection.collect{ |i| [i.name, i.id]}
  end

end
