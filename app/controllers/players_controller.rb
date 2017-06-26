class PlayersController < ApplicationController

  def new 
    @games = Game.all
    @player = Player.new
  end

  def create
    @player = Player.new(username: player_params[:username])
    if @player.save
      if player_params[:game_id]
        game_id = player_params[:game_id]
        @player.games << Game.find(game_id)
        Board.generate_player_game(@player)
        redirect_to "/deploy/#{game_id}/player/#{@player.id}"
      else
        game = Game.create()
        @player.games << game
        Board.generate_player_game(@player)
        redirect_to "/deploy/#{game.id}/player/#{@player.id}"
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