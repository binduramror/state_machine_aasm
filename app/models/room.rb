require 'aasm'

class Room < ApplicationRecord
    include AASM

    validates :person_name, presence: true
       
    aasm do
        state :draft, initial: true, after: :notify_draft
        state :pre_reserved
        state :booked, after: :notify_reservation
        state :fulfilled 
        state :available   
        event :pre_reserve! do
          transitions from: :draft, to: :pre_reserved
            transitions from: :pre_reserved, to: :booked, after: :process_book
            transitions from: :booked, to: :fulfilled
            transitions from: :fulfilled, to: :available
          end
        
    end


    def notify_draft
      puts "notify draft ................"
    end
    def process_book
      puts "process book ................."
    end
end
