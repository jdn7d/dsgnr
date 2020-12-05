class ReferencePhotosController < ApplicationController
 
   before_action :find_photo, only: [:show, :edit, :update, :destroy]

   def index 
     @reference_photos = current_designer.reference_photos    
   end

   def new
      @reference_photo = ReferencePhoto.new

      @room = Room.find_by_id(params[:store_id])
      @store = Store.find_by_id(params[:store_id])

      @rooms = current_designer.rooms
      @stores = current_designer.stores
   end

   def create
      current_designer

      @room = Room.find_by_id(params[:room_id])
      @reference_photo = ReferencePhoto.new(reference_photo_params)
      
      if @reference_photo.save
         redirect_to reference_photo_path(@reference_photo)
      else
         render :new
      end
   end

   def show 
      @designer = Designer.find(session[:designer_id])
      @reference_photo = ReferencePhoto.find(params[:id]) 
   end

   def edit
      @rooms = current_designer.rooms
      @stores = current_designer.stores
   end

   def update  
      @reference_photo.update(reference_photo_params)
      redirect_to '/reference_photos'
   end

   def destroy 
      @reference_photo.destroy
      redirect_to '/reference_photos'
   end
   
   private

   def find_photo
      @reference_photo = ReferencePhoto.find(params[:id])
   end

   def reference_photo_params
      params.require(:reference_photo).permit(:link, :room_id)
   end
end
