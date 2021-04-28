class Customer < ApplicationRecord
  belongs_to :room
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :contact_no
  validates_presence_of :email
  validates_presence_of :address
  validates :contact_no, numericality: true, format: { with: /[0-9]{9}/ }, allow_blank: true

  after_save :notify_user

  def name
    first_name + ' ' + last_name
  end

  def notify_user
    ConfirmationMailer.confirmation_details(self).deliver
  end
end
