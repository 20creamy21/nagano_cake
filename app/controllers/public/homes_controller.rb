class Public::HomesController < ApplicationController

  def top
    @customer = current_customer
    @items = Item.all
  end

  def about
    @customer = current_customer
  end

end
