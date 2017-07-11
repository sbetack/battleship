Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', :to => 'players#new'
  get '/game/:id', :to => 'games#show'
  resources :players
  get '/deploy/board/:board_id', :to => 'games#deploy_fleet', as: 'deploy'
  post 'place/board/:board_id', controller: 'ships', action: :place, as:"place_ships"
  get '/play/:game_id', :to => 'games#play'
end
