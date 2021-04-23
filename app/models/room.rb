require 'aasm'

class Room < ApplicationRecord
    include AASM

    has_many :customers
    validates :name, presence: true
    validates :room_no, presence: true, uniqueness: true
       
    aasm do
        state :available, initial: true, after: :notify_draft
        state :pre_reserved
        state :booked
        state :fulfilled 
        event :reserve! do
          transitions from: :available, to: :pre_reserved
          transitions from: :pre_reserved, to: :booked
          transitions from: :booked, to: :fulfilled
        end
        
    end


    def notify_draft
      puts "notify draft ................"
    end
    def process_book
      puts "process book ................."
    end
end
