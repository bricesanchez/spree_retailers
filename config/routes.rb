Spree::Core::Engine.routes.draw do

  namespace :admin do
    resources :retailer_types, :constraints => { :id => /.*/ }
    resources :retailers
    get '/find-local-stockists' => 'retailers#find_local_stockists', :as => :find_local_stockists
  end

  get '/retailers(/:retailer_type_id)' => 'retailers#index', :as => :retailer_type
end
