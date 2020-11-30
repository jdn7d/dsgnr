class PiecesController < ApplicationController
   
   def index 
      @designer = Designer.find(session[:designer_id])
      @pieces = @designer.pieces
   end

   def new
      @piece = Piece.new
      @room = Room.find_by_id(params[:room_id])
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
      @piece = Piece.find(params[:id]) 
   end

   def edit
   end

   def update  
   end

   def destroy 

   end

   def piece_params
      params.require(:piece).permit(:name, :category, :style, :quantity, :room_id, :store_id)
   end

end
