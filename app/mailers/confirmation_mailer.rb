class ConfirmationMailer < ApplicationMailer
    def confirmation_details(customer)
      @customer = customer
      mail(to: @customer.email, subject: "Room details")
    end

    def checkout_details(customer)
      @customer = customer
      mail(to: @customer.email, subject: "Room checkout details")
    end
end
