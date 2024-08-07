Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users 

  resources :leagues do

    resources :league_predictions

    resources :mini_leagues do
      resources :mini_league_users
      resources :mini_league_user_invites
    end

    resources :matches do
      resources :match_predictions
    end

  end
  
end
