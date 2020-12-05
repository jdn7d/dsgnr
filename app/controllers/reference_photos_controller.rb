class ReferencePhotosController < ApplicationController
      
   before_action :find_reference_photos, only: [:show, :edit, :update, :destroy]
   
   def index 
     @reference_photos = current_designer.reference_photos    
   end

   def new
      @reference_photo = ReferencePhoto.new
      @reference_photos = ReferencePhoto.find_by_id(params[:reference_photos_id])
      
      @reference_photos = current_designer.reference_photos 
      @rooms = current_designer.rooms
      @room = Room.find_by_id(params[:store_id])
   end

   def create
      @designer = session[:designer_id]
      @room = Room.find_by_id(params[:room_id])
      @reference_photo = ReferencePhoto.new(reference_photo_params)
      if @reference_photo.save
         redirect_to reference_photo_path(@reference_photo)
      else
         render :new
      end
   end

   def show 
      @reference_photoss = current_designer.reference_photos 
   end

   def edit
      @rooms = current_designer.rooms
      @reference_photoss = current_designer.reference_photos
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

   def find_reference_photos
      @reference_photos = ReferencePhoto.find(params[:id])
   end

   def reference_photo_params
      params.require(:reference_photo).permit(:link, :room_id)
   end
end
