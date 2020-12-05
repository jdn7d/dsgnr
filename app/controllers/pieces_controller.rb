class PiecesController < ApplicationController
   
   def index 
      @designer = Designer.find(session[:designer_id])
      @pieces = current_designer.pieces
   end

   def new
      @piece = Piece.new
      @room = Room.find_by_id(params[:room_id])
      @designer = Designer.find(session[:designer_id])
      @rooms = @designer.rooms
      @stores = @designer.stores
      @store = Store.find_by_id(params[:store_id])
   end

   def create
      @designer = session[:designer_id]
      @room = Room.find_by_id(params[:room_id])
      @piece = Piece.new(piece_params)
      if @piece.save
         redirect_to piece_path(@piece)
      else
         render :new
      end
   end

   def show 
      @designer = Designer.find(session[:designer_id])
      @rooms = designer.rooms
      @piece = Piece.find(params[:id]) 
   end

   def edit
      @designer = Designer.find(session[:designer_id])
      @rooms = @designer.rooms
      @stores = @designer.stores
      @piece = Piece.find(params[:id]) 

   end

   def update  
      @piece = Piece.find(params[:id])
      @piece.update(piece_params)
      redirect_to '/pieces'
   end

   def destroy 
      @piece = Piece.find(params[:id])
      @piece.destroy
      redirect_to '/pieces'
   end

   def piece_params
      params.require(:piece).permit(:name, :category, :style, :quantity, :room_id, :store_id)
   end

end
