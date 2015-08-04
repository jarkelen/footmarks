class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def set_filter_state(filters)
    params[:q] = {} unless params[:q]
    filters.each do |filter|
      cookies.delete(filter[1]) if params[:clear]

      if params[:q]
        unless params[:q][:s]
          if params[:q][filter[0]]
            cookies[filter[1]] = { value: params[:q][filter[0]], expires: 1.month.from_now }
          else
            params[:q][filter[0]] = cookies[filter[1]] unless cookies[filter[1]].blank?
          end
        end

        if params[filter[0]]
          cookies[filter[1]] = { value: params[filter[0]], expires: 1.month.from_now }
        else
          params[filter[0]] = cookies[filter[1]] unless cookies[filter[1]].blank?
        end
      end
    end
  end

end
