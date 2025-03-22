class OrderMailer < ApplicationMailer
  default from: "no-reply@f1ticketing.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.confirmation.subject
  #
  def confirmation(order)
    @order = order
    @line_items = @order.line_items
    email = "vishalkanteppa@gmail.com"
    mail to: email, subject: "Confirmation of Your Purchase"
  end
end
