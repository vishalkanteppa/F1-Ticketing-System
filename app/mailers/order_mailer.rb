class OrderMailer < ApplicationMailer
  default from: "vishalkanteppa@gmail.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.confirmation.subject
  #
  def confirmation(order)
    @order = order
    email = "vishalkanteppa@gmail.com"
    @greeting = "Hi"

    mail to: email, subject: "Confirmation of Your Purchase"
  end
end
