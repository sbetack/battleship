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
        @board = Board.create(player: @player, game_id: game_id)
        @board.generate_player_game
        # render 'games/deploy_fleet'
        redirect_to "/deploy/board/#{@board.id}"
      else
        game = Game.create()
        @board = Board.create(player: @player, game: game)
        @board.generate_player_game
        # render 'games/deploy_fleet'
        redirect_to "/deploy/board/#{@board.id}"
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