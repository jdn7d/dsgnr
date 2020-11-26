class ApplicationController < ActionController::Base

   def current_designer
      current_designer = Designer.find(session[:designer_id])
   end
end
