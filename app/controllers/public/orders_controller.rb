class Public::OrdersController < ApplicationController

  def index
    @customer = current_customer
  end

end
