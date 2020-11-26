class ApplicationController < ActionController::Base

   def current_designer
      @current_designer ||= Designer.find_by(id: session[:designer])
   end
end
