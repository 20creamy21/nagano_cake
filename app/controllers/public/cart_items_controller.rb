class Public::CartItemsController < ApplicationController

  before_action :authenticate_customer!, except: [:top]

  def create
    # @item = Item.all
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @customer = current_customer
    @cart_item.save
    redirect_to cart_items_path
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def index
    @customer = current_customer
    @cart_items = CartItem.all
  end

  def destroy_all
    @cart_items = CartItem.all
    @cart_items.destroy_all
    redirect_to items_path
  end

  def destroy
    @cart_items = CartItem.find(params[:id])
    @cart_items.destroy
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end
