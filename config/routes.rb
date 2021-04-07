Rails.application.routes.draw do

  devise_for :admin, controllers: {
  sessions: 'admin/sessions',
  registrations: 'admin/registrations',
  passwords: 'admin/passwords'
  }

  devise_for :customers, controllers: {
  sessions: 'public/customers/sessions',
  registrations: 'public/registrations',
  passwords: 'public/passwords'
  }

  namespace :admin do
    root to: "homes#top"
    resources :items, only:[:index, :new, :create, :show, :edit, :update]
    resources :genres, only:[:index, :create, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :orders, only:[:update]
  end

  namespace :public do
    root to: "homes#top"
    get '/about' => 'homes#about'
    resources :items, only:[:index, :show]
    resources :customers, only:[:show, :edit, :update, :unsubscribe, :withdraw]
    resources :cart_items, only:[:index, :update, :destroy, :destroy_all, :create]
    resources :orders, only:[:new, :comfirm, :complete, :create, :index, :show]
    resources :addresses, only:[:index, :edit, :create, :update, :destroy]
  end

end