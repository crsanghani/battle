require 'game'

describe Game do

subject(:game)    { described_class.new(player_1, player_2)   }
subject(:gameover){ described_class.new(dead_player, player_2)}
let(:player_1)    { double(:player, hit_points: 60) }
let(:player_2)    { double(:player, hit_points: 60) }
let(:dead_player) { double(:player, hit_points: 0)  }

  describe '#player_1' do
    it 'retrives the first player' do
      expect(game.player_1).to eq player_1
    end
  end

  describe '#player_2' do
    it 'retrives the second player' do
      expect(game.player_2).to eq player_2
    end
  end

  describe '#current_turn' do
    it 'starts as player_1' do
      expect(game.current_turn).to eq player_1
    end
  end

  describe '#switch_turns' do
    it 'switches the turn' do
      game.switch_turns
      expect(game.current_turn).to eq player_2
    end
  end

  describe '#opponent' do
   it 'should be the opponent of player_1' do
     expect(game.opponent).to eq player_2
   end
 end

  describe '#game_over?' do
    it 'returns false if no-one is at 0hp' do
      expect(game.game_over?).to be false
    end

     it 'returns true if someone is at 0hp' do
       expect(gameover.game_over?).to be true
     end
   end

 describe '#loser' do
   it 'returns player on less that 0HP' do
     expect(gameover.loser).to eq dead_player
   end
 end



end
