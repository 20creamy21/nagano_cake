class Public::ItemsController < ApplicationController
  
  before_action :authenticate_customer!, except: [:top]
  
end
