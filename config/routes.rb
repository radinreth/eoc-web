Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'sops#index'

  resources :sops do
    get :download, on: :collection
  end
end
