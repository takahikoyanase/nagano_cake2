Rails.application.routes.draw do

  devise_for :customers, controllers: {sessions: 'customers/sessions', passwords: 'customers/passwords', registrations: 'customers/registrations'}
  devise_for :admins, controllers: {sessions: 'admins/sessions', passwords: 'admins/passwords', registrations: 'admins/registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   namespace :admins do
    get "/" => "homes#top"
    resources :items,  only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :edit]
    resources :order_details, only: [:update]
   end

   namespace :public do
    resources :items, only: [:show, :index]
    root to: 'homes#top'
    get "about" => "homes#about"
    resources :customers, only: [:show, :edit, :update, :unsubscribe, :withdraw]
    resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
    resources :orders, only: [:new, :comfirm, :complete, :create, :index, :show]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
   end
end
