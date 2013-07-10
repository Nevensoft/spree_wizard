Spree::Core::Engine.routes.draw do

  namespace :admin do
    resources :wizards
  end

  resources :wizards, :only => [:index, :show] do 
    collection do 
      get 'taxon/:taxon_id/products' => 'wizards#taxon_products'
    end
  end

end
