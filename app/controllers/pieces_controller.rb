class PiecesController < ApplicationController
   
   before_action :find_piece, only: [:show, :edit, :update, :destroy]
   before_action :find_rooms, only: [:new, :create, :show, :edit]
   
   def index 
      @pieces = current_designer.pieces
   end

   def new
      @piece = Piece.new

      @room = Room.find_by_id(params[:room_id])
      @store = Store.find_by_id(params[:store_id])
      @stores = Store.all
 
   end

   def create
      current_designer

      @room = Room.find_by_id(params[:room_id])
      @piece = Piece.new(piece_params)

      if @piece.save
         redirect_to piece_path(@piece)
      else
         @stores = Store.all
         render :new
      end
   end

   def show 
   end

   def edit
      @stores = current_designer.stores
   end

   def update  
      @piece.update(piece_params)
      redirect_to '/pieces'
   end

   def destroy 
      @piece.destroy
      redirect_to '/pieces'
   end

   private

   def find_rooms
      @rooms = current_designer.rooms
   end

   def find_piece
       @piece = Piece.find(params[:id])
   end

   def piece_params
      params.require(:piece).permit(:name, :category, :style, :quantity, :room_id, :store_id)
   end

end
