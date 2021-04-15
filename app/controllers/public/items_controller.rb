class Public::ItemsController < ApplicationController

  before_action :authenticate_customer!, except: [:top]

  def index
    @customer = current_customer
    @items = Item.all
  end

  def show
    @customer = current_customer
    @item = Item.find(params[:id])
  end

  def create
  end

end
