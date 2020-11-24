class ApplicationController < ActionController::Base

   def current_designer
      if (designer_id == session[:designer_id])
         @current_designer 
      session[:designer_id] = @designer.id
   end
end
