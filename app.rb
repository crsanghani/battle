require 'sinatra/base'
require 'require_all'
require_all 'lib'

class Battle < Sinatra::Base

  use Rack::Session::Cookie,:key => 'rack.session',
                            :path => '/',
                            :secret => 'your_secret'

  get '/' do
    erb :index
  end

  get '/play' do
    @game = $game
    erb :play
  end

  post '/names' do
    player_1 = Player.new(params[:player_1_name])
    player_2 = Player.new(params[:player_2_name])
    $game = Game.new(player_1, player_2)
    redirect '/play'
  end

  get '/attack' do
    @game = $game
    @game.attack(@game.player_2)
    erb :attack
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
