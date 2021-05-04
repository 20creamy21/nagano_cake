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
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    cart_items = current_customer.cart_items

    cart_items.each do |ci|
      @order_detail = OrderDetail.new(
        order_id: @order.id,
        item_id: ci.item_id,
        price: ci.item.price,
        amount: ci.amount
      )
      @order_detail.save
    end

    cart_items.destroy_all
    redirect_to orders_complete_path
  end

  def index
    @customer = current_customer
    #Order.where(customer_id: current_customer)
    #@orders = Order.all
    #@orders = Order.where(customer_id: current_customer)
    @orders = Order.where(customer_id: current_customer).page(params[:page]).reverse_order
  end

  def show
    @customer = current_customer
    #@order = Order.find(params[:id])
    @order = Order.find(params[:id])
    #OrderDetail.where(order_id: @order.id)
    @order_details = OrderDetail.where(order_id: @order.id)
  end

  def complete
    @customer = current_customer
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :address, :total_payment, :postal_code, :name)
  end

end