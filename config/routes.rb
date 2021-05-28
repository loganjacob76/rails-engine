Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'merchants/find', to: 'merchants#find'
      get 'revenue/merchants', to: 'merchants#revenue'
      get 'revenue/merchants/:id', to: 'merchants#single_revenue'

      get 'items/find_all', to: 'items#find_all'
      get 'revenue/items', to: 'items#revenue'
      

      resources :merchants, only: [:index, :show] do
        resources :items, controller: :merchant_items, only: :index
      end
      
      resources :items, except: [:new, :edit] do
        resources :merchant, controller: :items_merchant, only: :index
      end
    end
  end
end
