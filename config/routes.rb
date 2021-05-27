Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'merchants/find', to: 'merchants#find'

      get 'items/find_all', to: 'items#find_all'

      resources :merchants, only: [:index, :show] do
        resources :items, controller: :merchant_items, only: :index
      end
      
      resources :items, except: [:new, :edit] do
        resources :merchant, controller: :items_merchant, only: :index
      end
    end
  end
end
