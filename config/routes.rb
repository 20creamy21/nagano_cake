Rails.application.routes.draw do

  namespace :admin do
    devise_scope :admins do
      get    "sign_in"  => "/admin/sessions#new"
      post   "sign_in"  => "/admin/sessions#create"
      delete "sign_out" => "/admin/sessions#destroy"
    end
    root to: "homes#top"
    resources :items, only:[:index, :new, :create, :show, :edit, :update]
    resources :genres, only:[:index, :create, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :orders, only:[:update]
  end

end
