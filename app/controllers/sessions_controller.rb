class SessionsController < ApplicationController

   def create 
      @designer = Designer.find_by_email(params[:email])
   
      if @designer && @designer.authenticate(params[:password])
         session[:designer_id] = @designer.id
         redirect_to designer_path(@designer)
      else
         #flash[:message] = "Invalid email or password"
         redirect_to '/signin'
      end

   end

   def destroy
      session.delete :designer_id
      redirect_to '/signin'
   end

   def google_login
      designer_email = request.env['omniauth.auth']['info']['email']
      designer_username = request.env['omniauth.auth']['info']['name']
      @designer = Designer.find_or_create_by(email: designer_email) do |designer|
         @designer.username = designer_username
         @designer.password = SecureRandom.hex
      end
      session[:designer_id] = @designer.id
      redirect_to designer_path(@designer)
   end

   private
 
   def auth
      request.env['omniauth.auth']
   end

end