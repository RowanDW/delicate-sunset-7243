Rails.application.routes.draw do
  resources :flights, only: [:index]
  resources :manifest_entries, only: [:destroy]
  resources :airlines, only: [:show]
end
