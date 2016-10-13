require 'spec_helper'
require 'game'

describe Game do

  subject(:game)      {described_class.new(bob, larry)}
  subject(:ended_game) {described_class.new(dead_player, bob)}
  let(:bob)           {double :player, health: 100}
  let(:larry)         {double :player, health: 100}
  let(:dead_player)   {double :player, health: 0}

  describe 'initialization' do
    it 'contains player 1' do
      expect(game.player_1).to eq bob
    end
    it 'contains player 2' do
      expect(game.player_2).to eq larry
    end
  end

  describe '#attack' do
    it 'should attack the other player' do
      expect(larry).to receive(:reduce_health)
      subject.attack(larry)
    end
  end

  describe '#switch turns' do
    it 'switched the turn' do
      game.switch_turns
      expect(game.current_turn).to eq larry
    end
  end

  describe '#game_over?' do
    it 'returns true if one player has 0 hp' do
      expect(ended_game.game_over?).to be true
    end

    it 'returns false if no one is dead' do
      expect(game.game_over?).to be false
    end
  end

  describe '#loser' do
    it 'returns dead player' do
      expect(ended_game.loser).to eq dead_player
    end
  end
end
