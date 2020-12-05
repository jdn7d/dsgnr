class SessionsController < ApplicationController

   def new
   end

   def create 
      @designer = Designer.find_by_email(params[:email])
   

      if @designer && @designer.authenticate(params[:password])
         session[:designer_id] = @designer.id
         redirect_to designer_path(@designer)
      else
         redirect_to '/signin'
      end

   end

   def destroy
      session.delete :designer_id
      redirect_to '/signin'
   end

    private
 
   def auth
      request.env['omniauth.auth']
   end

end