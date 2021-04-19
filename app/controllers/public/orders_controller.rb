class Public::OrdersController < ApplicationController

  def new

  end

  def confirm

  end


  def index
    @customer = current_customer
  end

end
