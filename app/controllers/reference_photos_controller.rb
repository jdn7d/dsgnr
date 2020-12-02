class ReferencePhotosController < ApplicationController
   
   def index 
     @designer = Designer.find(session[:designer_id])
     # @reference_photos = @designer.reference_photos
     @reference_photos = @designer.reference_photos    
   end

   def new
      @reference_photo = ReferencePhoto.new
      @reference_photos = ReferencePhoto.find_by_id(params[:reference_photos_id])
      @designer = Designer.find(session[:designer_id])
      @reference_photos = @designer.reference_photos
      @rooms = @designer.rooms
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
      @designer = Designer.find(session[:designer_id])
      @reference_photoss = @designer.reference_photos
      @reference_photo = ReferencePhoto.find(params[:id]) 
   end

   def edit
      @designer = Designer.find(session[:designer_id])
      @reference_photoss = @designer.reference_photos
      @reference_photo = ReferencePhoto.find(params[:id]) 
   end

   def update  
      @reference_photo = reference_photo.find(params[:id])
      @reference_photo.update(reference_photo_params)
      redirect_to '/reference_photos'
   end

   def destroy 
      @reference_photo = ReferencePhoto.find(params[:id])
      @reference_photo.destroy
      redirect_to '/reference_photos'
   end

   def reference_photo_params
      params.require(:reference_photo).permit(:link, :room_id)
   end
end
