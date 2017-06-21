class GamesController < ApplicationController
  
  def index
    @games = Game.all
  end

  def deploy_fleet
    
  end
end