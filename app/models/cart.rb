class Cart < ActiveRecord::Base
  has_many :cart_items, dependent: :destroy
  has_many :items, through: :cart_items, source: :product

  def find_cart_item(product)
    cart_items.find_by(product_id: product)
  end

  def add_product_to_cart(product)
    ci = cart_items.build
    ci.product = product
    ci.save
  end

  def total_quantity
    quantity = 0

    cart_items.each do |cart_item|
      quantity += cart_item.quantity
    end

    return quantity
  end

  def total_price
    sum = 0
    quantity = 0

    cart_items.each do |cart_item|
      quantity += cart_item.quantity
      sum = sum + (cart_item.product.price * cart_item.quantity) #+ shippingcost
    end

    if quantity <= 3
      sum = sum + 65
    end

    sum
  end

  def clean!
    cart_items.destroy_all
  end

end
