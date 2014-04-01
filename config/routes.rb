Spree::Core::Engine.routes.draw do

  namespace :admin do
    resources :retailer_types, :constraints => { :id => /.*/ }
    resources :retailers
  end

  get '/retailers/:retailer_type_id' => 'retailers#index', :as => :retailer_type, :constraints => { :retailer_type_id => /.*/ }
  resources :retailers, :only => :index
  
end
