class StoresController < ApplicationController

  def index 
     # @designer = Designer.find(session[:designer_id])
      @stores = Store.all
   end

   def new 
      @store = Store.new
   end

   def create
    #  @designer = session[:designer_id]
      @store = Store.new(store_params)
     
      if @store.save
         redirect_to store_path(@store)
      else
         render :new
      end
   end

   def show 
      @store = Store.find(params[:id])
   end

   def edit
      @store = Store.find(params[:id])
   end

   def update 
      @store = Store.find(params[:id])
      @store.update(store_params) 
      redirect_to '/stores'
   end

   def destroy 
      @store = Store.find(params[:id])
      @store.destroy
      redirect_to stores_path
   end

   private

   def store_params
      params.require(:store).permit(:name, :location, :link, :price)
   end

end
