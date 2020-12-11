Rails.application.routes.draw do

  #custom routes up here 

  get '/signup' => 'designers#new'
  post '/signup' => 'designers#create'

  get '/auth/google/callback' => 'sessions#create'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'
  get '/logout' => 'sessions#destroy'

  get 'auth/google_oauth2/callback', to: 'sessions#google_login'

  resources :pieces
  
  resources :rooms
  resources :rooms do
    resources :pieces
  end
  resources :rooms do
    resources :reference_photos
  end

  resources :stores
  resources :stores do
    resources :pieces, only: [:index, :show, :new, :edit]
  end
    #not neccessary but good for user signs up incorrectly 
      #and needs to be rerouted back to the signup
  resources :sessions
  resources :reference_photos
  
  resources :designers

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
