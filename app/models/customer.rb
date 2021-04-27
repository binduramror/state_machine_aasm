class Customer < ApplicationRecord
  belongs_to :room
  validates_presence_of :first_name
  validates_presence_of :last_name

  after_save :notify_user

  def name
    first_name + ' ' + last_name
  end

  def notify_user
    ConfirmationMailer.confirmation_details(self).deliver
  end
end
