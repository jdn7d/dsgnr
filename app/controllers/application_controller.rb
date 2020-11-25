class ApplicationController < ActionController::Base

   def current_designer
      @current_designer ||= User.find_by(id: session[:user])
   end
end
