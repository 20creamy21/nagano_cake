class Public::CustomersController < ApplicationController
  
  before_action :authenticate_customer!, except: [:top]
  
  def show
  end
  
end
