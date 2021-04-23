module RoomsHelper
    def available_rooms
      @available_rooms = Room.where(aasm_state: 'Available')
    end
  end
  