class OrdersController < ApplicationController
  before_action :authenticate_user!

# NEW
  def new
    @order = Order.new
  end

# CREATE
  def create
    @order = current_user.orders.new(order_params)
    @order.total = current_user.cart.cart_items.sum(:price)
    if @order.save
      current_user.cart.cart_items.each do |item|
        @order.order_items.create(product: item.product, quantity: item.quantity, price: item.product.price)
      end
      current_user.cart.cart_items.destroy_all
      redirect_to root_path, notice: 'Order was successfully created.'
    else
      render :new
    end
  end

private

  def order_params
    params.permit(:address, :city, :country, :zip_code)
  end
end
