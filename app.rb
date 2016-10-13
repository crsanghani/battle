require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base

  # enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    player_1 = Player.new(params[:player_1_name])
    player_2 = Player.new(params[:player_2_name])
    $game = Game.new(player_1, player_2)
    redirect '/play'
  end

  get '/play' do
    @new_game = $game
    erb(:play)
  end

  post '/aftermath' do
    @new_game = $game
    @new_game.attack(@new_game.opponent)
      if @new_game.game_over?
        redirect '/game_over'
      else
        redirect '/aftermath'
      end
  end

  get '/aftermath' do
    @new_game = $game
    erb(:aftermath)
  end

  get '/game_over' do
    @new_game = $game
    erb(:game_over)
  end

  post '/switch_turns' do
    $game.switch_turns
    redirect '/play'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
