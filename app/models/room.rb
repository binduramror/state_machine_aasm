require 'aasm'

class Room < ApplicationRecord
    include AASM

    has_many :customers, dependent: :destroy
    validates :name, presence: true
    validates :room_no, presence: true, uniqueness: true

    aasm do
      state :available, initial: true
      state :booked, before_enter: :get_status
      state :checkout

      event :ava_che do
        transitions from: :checkout, to: :available
      end
      event :ava_che_rev do
        transitions from: :available, to: :checkout
      end

      event :ava_book, after: :check_status do
        transitions from: :available, to: :booked
      end
      event :ava_book_rev do
        transitions from: :booked, to: :available
      end

      event :book_che do
        transitions from: :booked, to: :checkout
      end
      event :book_che_rev do
        transitions from: :checkout, to: :booked      
      end

      event :book_ava do
        transitions from: :booked, to: :available
      end
      event :book_ava_rev do
        transitions from: :available, to: :booked      
      end
   
      after_all_transitions :notify_about_status
  end

  def check_status
    if self.aasm_state == "booked"
      true
    else
      false
    end
  end

  def get_status
    self.aasm_state
  end

  def notify_about_status
    puts "from after all transactions....."
    self.aasm_state
  end  
end
