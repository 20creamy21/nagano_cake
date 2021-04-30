Rails.application.routes.draw do

  scope module: :public do
    root to: "homes#top"
    get '/about' => 'homes#about'
    resources :items, only:[:index, :show]
    get '/customers/my_page' => 'customers#show'
    get '/customers/edit' => 'customers#edit'
    patch '/customers' => 'customers#update'
    get 'customers/edit' => 'public/customers#edit'
    get '/customers/unsubscribe' => 'customers#unsubscribe'
    patch '/customers/withdraw' => 'customers#withdraw'
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, only:[:index, :update, :destroy, :destroy_all, :create]
    get '/orders/complete' => 'orders#complete'
    resources :orders, only:[:new, :create, :index, :show]
    post '/orders/confirm' => 'orders#confirm'
    resources :addresses, only:[:index, :edit, :create, :update, :destroy]
  end

  devise_for :admin, controllers: {
    sessions: 'admin/sessions',
    registrations: 'admin/registrations',
    passwords: 'admin/passwords'
  }

  devise_for :customers, controllers: {
    sessions: 'public/customers/sessions',
    registrations: 'public/customers/registrations',
    passwords: 'public/customers/passwords'
  }

  namespace :admin do
    root to: "homes#top"
    resources :items, only:[:index, :new, :create, :show, :edit, :update]
    resources :genres, only:[:index, :create, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :orders, only:[:show, :update]
  end

end