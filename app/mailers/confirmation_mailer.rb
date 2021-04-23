class ConfirmationMailer < ApplicationMailer
    def confirmation_details
        email = "faizza.rk26@gmail.com"
        #binding.pry
        mail(to: email, subject: "You got a new order!")
      end
end
