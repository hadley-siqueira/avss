Rails.application.routes.draw do
  resources :stations do
  end

  get 'stations/:id/title', to: 'stations/title#show', as: 'foobar'
  patch 'stations/:id/title', to: 'stations/title#update'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'home#index'
end
