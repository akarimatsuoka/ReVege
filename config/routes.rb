Rails.application.routes.draw do

      # 顧客用
    # URL /customers/sign_in ...
    devise_for :customers, skip: [:passwords],controllers: {
      registrations: "public/registrations",
      sessions: 'public/sessions'
    }

    scope module: :public do
    	root to:"homes#top"
      get "about"=>"homes#about",as:"about"
    end

    #public/customers
    scope module: :public do
      get 'customers/my_page' => 'customers#show', as: 'my_page'
      get 'customers/information/edit' => 'customers#edit'
      patch 'customers/information' => 'customers#update', as: 'information'

      get 'customers/confirm' => "customers#confirm", as: 'confirm' #退会確認ページ
      patch 'customers/withdraw' => 'customers#withdraw', as: 'withdraw' #退会処理
    end

    #public/addresses
    scope module: :public do
      resources :shipping_addresses
    end


    # 管理者用
    # URL /admin/sign_in ...
    devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
      sessions: "admin/sessions"
    }

    namespace :admin do
      resources :genres
      resources :items
      resources :shops
    end

end
