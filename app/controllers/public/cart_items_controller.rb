class Public::CartItemsController < ApplicationController

  before_action :authenticate_customer!, except: [:top]

  def index
    @customer = current_customer
  end

end
