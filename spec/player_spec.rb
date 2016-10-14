require 'player'

describe Player do

  subject(:snuggles)  { described_class.new('Snuggles') }
  subject(:amaal)     { described_class.new('Amaal') }

  describe '#name' do
    it "returns player's name" do
      expect(amaal.name).to eq('Amaal')
    end
  end

  describe '#hit_points' do
    it "returns the hit points" do
      expect(amaal.hit_points).to eq described_class::DEFAULT_HIT_POINTS
    end
  end

  describe '#receive_damage' do
    it "returns player's reduced hit points" do
      allow(amaal).to receive(:random_damage).and_return(20)
      expect{amaal.receive_damage}.to change{amaal.hit_points}.by(-20)
    end
  end
end
