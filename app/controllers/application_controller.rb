class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
  
    def route_not_found
      render file: Rails.root.join('public/404.html'), status: :not_found, layout: false
    end

    private
    
    def redirect_with_success(path, message)
      redirect_to path, notice: message
    end
    
    def redirect_with_error(path, message)
      redirect_to path, alert: message
    end
end
