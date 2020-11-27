Rails.application.routes.draw do

  #custom routes up here 

  get '/signup' => 'designers#new'
  post '/signup' => 'designers#create'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'
  get '/logout' => 'sessions#destroy'

  resources :rooms do
    resources :pieces, only: [:index, :show, :new, :edit]
  end
    #not neccessary but good for user signs up incorrectly 
      #and needs to be rerouted back to the signup
  resources :sessions
  resources :reference_photos
  resources :stores
  resources :designers
  resources :pieces
  resources :rooms
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
