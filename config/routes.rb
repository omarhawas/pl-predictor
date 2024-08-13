Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  scope 'api/v1' do

    post '/login', to: 'users#login'
    post '/signup', to: 'users#signup'

    resources :users 

    post '/sync_leagues', to: 'leagues#sync_leagues'
    post '/leagues/:league_id/sync_matches', to: 'matches#sync_matches'
    post '/sync_results', to: 'matches#sync_results'


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

end
