class RoomsController < ApplicationController
   
   def index 
      @rooms = Room.all
   end

   def new 
      @room = Room.new
   end

   def create
     @room = Room.create(room_params)
     redirect_to room_path(@room)
   end

   def show 
   end

   private

   def room_params
      params.require(:room).permit(:name, :wall_color, :floor_color, :light)
   end

end