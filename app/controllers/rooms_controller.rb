class RoomsController < ApplicationController
   
   before_action :find_room, only: [:show, :edit, :update, :destroy]

   def index 
      @designer = Designer.find(session[:designer_id])
      @rooms = @designer.rooms
   end

   def new 
      @room = Room.new
   end

   def create
      @designer = session[:designer_id]
      @room = Room.new(room_params)
     
      if @room.save
         redirect_to room_path(@room)
      else
         render :new
      end
   end

   def show 
      @room = Room.find(params[:id])
   end

   def edit
      @room = Room.find(params[:id])
   end

   def update 
      @room = Room.find(params[:id])
      @room.update(room_params) 
      redirect_to '/rooms'
   end

   def destroy 
      @room = Room.find(params[:id])
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