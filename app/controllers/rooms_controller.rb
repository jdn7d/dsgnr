class RoomsController < ApplicationController
   
   before_action :find_room, only: [:show, :edit, :update, :destroy]

   def index 
      @rooms = current_designer.rooms
   end

   def new 
      @room = Room.new
   end

   def create
      @room = Room.new(room_params)
      if @room.save
         redirect_to room_path(@room)
      else
         render :new
      end
   end

   def update 
      if @room.update(room_params) 
         redirect_to room_path(@room)
      else
         render :edit
      end
   end

   def destroy 
      @room.destroy
      redirect_to rooms_path
   end

   private

   def find_room
      @room = Room.find(params[:id])
   end
   
   def room_params
      params.require(:room).permit(:name, :wall_color, :floor_color, :light, :designer_id)
   end

end