class ProcessPaymentOrderJob < ApplicationJob
  queue_as :default

  def perform(order:, payment_type:, payment_details:)
    order.process_payment!(payment_type: payment_type, payment_details: payment_details)
  end
end
