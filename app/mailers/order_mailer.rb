class OrderMailer < ApplicationMailer
  def order_confirmation(order)
    @order = order
    mail to: order.account.user.email
  end
end
