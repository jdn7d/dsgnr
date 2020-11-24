class DesignersController < ApplicationController

   def new 
      @designer = Designer.new
   end

   def create
      @designer = Designer.new(designer_params)
      if @designer.save
         session[:designer_id] = @designer.id
         redirect_to @designer
      else 
         render :new
      end   
   end
   
   def show
      @designer = Designer.find(params[:id] )
   end

   private

   def designer_params
      params.require(:designer).permit(:username, :email, :password)
   end

end