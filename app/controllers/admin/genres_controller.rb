class Admin::GenresController < ApplicationController
  
  before_action :authenticate_admin!, except: [:top]
  
end
