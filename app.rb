require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base

  # enable :sessions

  before do
    @game = Game.instance
  end

  get '/' do
    erb :index
  end

  post '/names' do
    player_1 = Player.new(params[:player_1_name])
    player_2 = Player.new(params[:player_2_name])
    @game = Game.create(player_1, player_2)
    redirect '/play'
  end

  get '/play' do
    erb(:play)
  end

  post '/aftermath' do
    @game.attack(@game.opponent)
      if @game.game_over?
        redirect '/game_over'
      else
        redirect '/aftermath'
      end
  end

  get '/aftermath' do
    erb(:aftermath)
  end

  get '/game_over' do
    erb(:game_over)
  end

  post '/switch_turns' do
    @game.switch_turns
    redirect '/play'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
