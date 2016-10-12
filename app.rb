require 'sinatra/base'
require 'player'

class Battle < Sinatra::Base

  use Rack::Session::Cookie,:key => 'rack.session',
                            :path => '/',
                            :secret => 'your_secret'

  get '/' do
    erb :index
  end

  get '/play' do
    @player_1_name = $player_1.name
    @player_2_name = $player_2.name
    erb :play
  end

  post '/names' do
    p params
    $player_1 = Player.new(params[:player_1_name])
    $player_2 = Player.new(params[:player_2_name])
    redirect '/play'
  end

  get '/attack' do
    @player_1_name = $player_1
    @player_2_name = $player_2
    Game.new.attack(@player_2_name)
    erb :attack
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
