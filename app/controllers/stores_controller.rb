class StoresController < ApplicationController

   before_action :find_store, only: [:show, :edit, :update, :destroy]

   def index 
      @stores = current_designer.stores
   end

   def new 
      @store = Store.new
   end

   def create
      
      @store = Store.new(store_params)
      
      if @store.save
         redirect_to store_path(@store)
      else
         render :new
      end
   end

   def update
      @store.update(store_params) 
      redirect_to '/stores'
   end

   def destroy 
      @store.destroy
      redirect_to stores_path
   end

   private

   def find_store
      @store = Store.find(params[:id])
   end

   def store_params
      params.require(:store).permit(:name, :location, :link, :price, :designer_id)
   end

end
