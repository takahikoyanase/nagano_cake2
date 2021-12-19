Rails.application.routes.draw do

  devise_for :customers, controllers: {sessions: 'public/sessions', passwords: 'public/passwords', registrations: 'public/registrations'}
  devise_for :admins, controllers: {sessions: 'admins/sessions', passwords: 'admins/passwords', registrations: 'admins/registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   namespace :admins do
    get "/" => "homes#top"
    resources :items,  only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update
    ]
    resources :order_details, only: [:update]
   end

   scope module: :public do
    resources :items, only: [:show, :index]
    root to: 'homes#top'
    get "about" => "homes#about"
    get "/customers/:id/unsubscribe" => "customers#unsubscribe", as: "unsubscribe"
    patch "/customers/:id/withdrawal" => "customers#withdrawal", as: "withdrawal"
    resources :customers, only: [:show, :edit, :update ]
    resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
    resources :orders, only: [:new, :comfirm, :complete, :create, :index, :show]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
   end
end
