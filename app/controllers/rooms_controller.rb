class RoomsController < ApplicationController
  before_action :set_room, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token, :only=> [:change_state]

  # GET /rooms or /rooms.json
  def index
    @rooms = Room.where(:aasm_state => "available")
  end

  # GET /rooms/1 or /rooms/1.json
  def show
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms or /rooms.json
  def create
    @room = Room.new(room_params)
    #BookingService.new(@room)
    #ConfirmationMailer.confirmation_details.deliver
    
    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: "Room was successfully created." }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1 or /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: "Room was successfully updated." }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1 or /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: "Room was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def change_state
    customer = Customer.find(params[:customer_id])
    room = customer.room
    if room.aasm_state == "available"
      room.ava_book!
    elsif room.aasm_state == "booked"
      room.book_che!
      ConfirmationMailer.checkout_details(customer).deliver
    end
    render json: room.to_json 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def room_params
      params.require(:room).permit(:name, :room_no, :room_type, :facilities, :price)
    end
end
