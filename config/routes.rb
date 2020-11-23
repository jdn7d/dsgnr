Rails.application.routes.draw do

  #custom routes up here 

  get '/signup' => 'users#new'
  post '/signup' => 'user#create'
    #not neccessary but good for user signs up incorrectly 
      #and needs to be rerouted back to the signup
  resources :reference_photos
  resources :stores
  resources :designers
  resources :pieces
  resources :rooms
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
