class Public::OrdersController < ApplicationController

  def new
    @customer = current_customer
    @order = Order.new
  end

  def confirm
    @customer = current_customer
    @cart_items = CartItem.all
    @order = Order.new(order_params)
  end

  def create
    #@order.address = @customer.address
    @order = Order.new(order_params)
    @order.save
    redirect_to orders_complete_path
    # redirect_to cart_items_destroy_all_path
  end

  def index
    @customer = current_customer
  end

  def complete
    @customer = current_customer
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :address)
  end

end
