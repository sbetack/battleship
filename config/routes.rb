Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', :to => 'players#new'
  get '/game/:id', :to => 'games#show'
  resources :players
  get '/deploy/:game_id', :to => 'games#deploy_fleet'
end
