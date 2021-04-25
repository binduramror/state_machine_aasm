class ConfirmationMailer < ApplicationMailer
    def confirmation_details
      mail(to: "noorfaiza496@gmail.com", subject: "You got a new order!")
    end
end
