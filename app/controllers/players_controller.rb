class PlayersController < ApplicationController

  def new 
    @games = Game.all
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      if player_params[:game_id]
        game_id = player_params[:game_id]
        @player.games << Game.find(game_id)
        redirect_to "/deploy/#{game_id}"
      else
        game = Game.new()
        @player.games << game
        redirect_to "/deploy/#{game.id}"
      end
    else 
      @errors = @player.errors.full_messages
      render :new
    end
  end

  private

  def player_params
      params.require(:player).permit(:username, :game_id)
  end
end