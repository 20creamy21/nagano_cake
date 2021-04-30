class Admin::OrdersController < ApplicationController

  before_action :authenticate_admin!, except: [:top]

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
  end

end
