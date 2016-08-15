class OrderMailer < ApplicationMailer
  def notify_order_placed(order)
    @order       = order
    @user        = order.user
    @order_items = @order.items
    @order_infor = @order.info

    mail(to: @user.email , subject: "[MOYO Taiwan] 感謝您完成本次的下單，以下是您的購物明細 #{order.token}")
  end
end
