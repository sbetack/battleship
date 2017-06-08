class PlayersController < ApplicationController

  def new 
    @games = Game.all
  end
end