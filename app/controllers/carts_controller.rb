class CartsController < ApplicationController
  before_action :authenticate_user!, only: [:checkout]

  def checkout
    @order = current_user.orders.build
    @info = @order.build_info
  end

  def clean
    current_cart.clean!
    flash[:warning] = "已清空購物車"
    redirect_to carts_path
  end

#  def shippingcost
#    @cart = current_cart
#    @item = @cart.cart_item
#    @order = current_user.orders.build

#    if @item.quantity >= 3
#      @order.shippingcost = 0
#    else
#      @order.shippingcost = 65
#    end
#  end
end
