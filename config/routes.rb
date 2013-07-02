Spree::Core::Engine.routes.draw do

  namespace :admin do
    resources :wizards
  end

  resources :wizards, :only => [:index, :show]
end
