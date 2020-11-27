class PiecesController < ApplicationController
   
   def index 
      @designer = Designer.find(session[:designer_id])
      @pieces = @designer.pieces
   end

   def new
      @piece = Piece.new
   end

   def create
      @designer = session[:designer_id]
      @piece = Piece.new(piece_params)
     
      if @piece.save
         redirect_to piece_path(@piece)
      else
         render :new
      end
   end

   def show  
   end

   def edit
   end

   def update  
   end

   def destroy 

   end

   def piece_params
      params.require(:piece).permit(:name, :category, :style, :quantity, :room_name, :store_name)
   end

end
