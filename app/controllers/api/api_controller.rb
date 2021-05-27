class API::APIController < ActionController::Base
  protect_from_forgery except: [:create, :destroy, :update]
  
  def paginate(query)
    query.limit(page_size).offset(page * page_size)
  end

  def page
    [
      params.fetch(:page, 1).to_i, 1
    ].max - 1
  end
  
  def page_size
    params.fetch(:per_page, 20).to_i
  end
end
