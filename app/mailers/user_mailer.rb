class UserMailer < ApplicationMailer

  def order_receipt(order)
    @order = order
    mail(to: @order.email, subject: "Jungle Receipt " @order.id)
  end
end
