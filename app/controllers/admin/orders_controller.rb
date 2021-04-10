class Admin::OrdersController < ApplicationController
  
  before_action :authenticate_admin!, except: [:top]
  
end
