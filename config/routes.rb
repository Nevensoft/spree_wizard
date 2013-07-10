Spree::Core::Engine.routes.draw do

  namespace :admin do
    resources :wizards
  end

  resources :wizards, :only => [:index, :show] do 
    collection do 
      # eventually move this else where.
      get 'taxon_products/:taxon_id' => 'wizards#taxon_products'
    end
  end

end
