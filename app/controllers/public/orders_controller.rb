class Public::OrdersController < ApplicationController

  def new
    @customer = current_customer
    @order = Order.new
  end

  def confirm
    
  end


  def index
    @customer = current_customer
  end

end
