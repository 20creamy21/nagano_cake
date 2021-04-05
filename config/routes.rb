Rails.application.routes.draw do

  devise_for :admin

  # devise_scope :admin do
  #   get    "admin/sign_in"  => "devise/sessions#new"
  #   post   "admin/sign_in"  => "devise/sessions#create"
  #   delete "admin/sign_out" => "devise/sessions#destroy"
  # end

  namespace :admin do
    root to: "homes#top"
    resources :items, only:[:index, :new, :create, :show, :edit, :update]
    resources :genres, only:[:index, :create, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :orders, only:[:update]
  end

end
