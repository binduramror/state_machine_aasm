require 'aasm'

class Room < ApplicationRecord
    include AASM

    validates :name, presence: true
    validates :room_no, presence: true, uniqueness: true
       
    aasm do
      state :available, initial: true, after: :notify
      state :reserved, before_enter: :confirm_details
      state :booked, after: :send_confirmation
      state :checkout

      event :ava_che do
        transitions from: :checkout, to: :available
      end
      event :ava_che_rev do
        transitions from: :available, to: :checkout
      end

      event :ava_res do
        transitions from: :available, to: :reserved
      end
      event :ava_res_rev do
        transitions from: :available, to: :reserved
      end

      event :ava_book do
        transitions from: :available, to: :booked
      end
      event :ava_book_rev do
        transitions from: :booked, to: :available
      end

      event :res_book do
        transitions from: :reserved, to: :booked
      end
      event :res_book_rev do
        transitions from: :booked, to: :reserved
      end

      event :res_che do
        transitions from: :reserved, to: :checkout
      end
      event :res_che_rev do
        transitions from: :checkout, to: :reserved
      end
   
      after_all_transitions :notify
  end


    def confirm_details
      puts "confirm details from from customer..........."
    end
    def send_confirmation
      puts "send mail confirmation ................."
    end

    def notify
      puts "send notification ....."
    end
end
