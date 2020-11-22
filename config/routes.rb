Rails.application.routes.draw do
  resources :reference_photos
  resources :stores
  resources :designers
  resources :pieces
  resources :rooms
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
