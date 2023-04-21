class CartsController < ApplicationController
  before_action :authenticate_user!

# SHOW  
  def show
    @cart_items = current_user.cart.cart_items
  end

# CREATE
  def add_to_cart
    product = Product.find(params[:product_id])
    current_user.cart.cart_items.create(product: product, quantity: 1)
    redirect_to cart_path
  end

# DESTROY
  def remove_from_cart
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_path
  end
end

