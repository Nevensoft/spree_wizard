Spree::Core::Engine.routes.draw do

  namespace :admin do
    resources :wizards do 
      member do 
        get :add_taxon
      end
    end
      
    resources :wizard_taxons, only: [:destroy]
  end

  resources :wizards, only: [:index, :show] do 
    collection do 
      get 'taxon/:taxon_id/products' => 'wizards#taxon_products'
    end
  end
  get 'bundles/:permalink' => 'wizards#bundle_show'
end
