class Admin::CustomersController < ApplicationController

  before_action :authenticate_admin!, except: [:top]

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

end
