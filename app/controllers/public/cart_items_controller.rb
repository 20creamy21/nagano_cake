class Public::CartItemsController < ApplicationController
  
  before_action :authenticate_customer!, except: [:top]
  
end
