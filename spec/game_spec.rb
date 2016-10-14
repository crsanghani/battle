# require 'player'
require 'game'


describe Game do
  subject(:game)          { described_class.new(snuggles, amaal) }
  subject(:finished_game) { described_class.new(dead_player, amaal) }
  let(:snuggles)          { double :player, hit_points: 60  }
  let(:amaal)             { double :player, hit_points: 60 }
  let(:dead_player)       { double :player, hit_points: 0}

  describe '#player_1' do
    it 'retrieves the first player' do
      expect(game.players[0]).to eq snuggles
    end
  end

  describe '#player_2' do
    it 'retrieves the second player' do
      expect(game.players[1]).to eq amaal
    end
  end

  describe '#attack' do
    it 'damages the player' do
      expect(amaal).to receive(:receive_damage)
      game.attack(amaal)
    end
  end

  describe '#current_player' do
    it 'starts as player 1' do
      expect(game.current_player).to eq snuggles
    end
  end

  describe "switch_player" do
    it 'switches the turn' do
      game.switch_player
      expect(game.current_player).to eq amaal
    end
  end

  describe '#game_over?' do
   it 'returns false if no-one is at 0HP' do
      expect(game).not_to be_game_over
    end

    it 'returns true if at least one player is at 0HP' do
      expect(finished_game).to be_game_over
    end
  end

end
