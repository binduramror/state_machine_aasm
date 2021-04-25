# Preview all emails at http://localhost:3000/rails/mailers/confirmation_details_mailer
class ConfirmationDetailsMailerPreview < ActionMailer::Preview
  def confirmation_details
    ConfirmationMailer.confirmation_details
  end
end
