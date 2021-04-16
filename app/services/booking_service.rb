class BookingService
  include AASM
  attr_reader :room
  
  def initialize(room)
    @room = room
    binding.pry
    aasm.current_state = room.status.to_sym
  end

  aasm do
    state :draft, initial: true, after: :notify_draft
    state :pre_reserved
    state :booked, after: :notify_reservation
    state :fulfilled     
    # This callback could be something different, will dependent of your code
    after_all_transitions :save_state      
    event :pre_reserve! do
      transitions from: :draft, 
        to: :pre_reserved, 
        after: :notify_draft
    end      
    event :book do
      transitions from: :pre_reserved,
        to: :booked,
        after: :process_book
    end
  end

  def notify_draft
    puts "notify user about booking room..."
  end

  def process_book
    puts "Room booking is in process...."
  end

  def save_state 
    room.update_attributes!(status: aasm.to_state) 
  end
end