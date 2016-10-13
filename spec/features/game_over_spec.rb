require_relative 'welpers'
require 'spec_helper'

feature 'Game Over' do
  context 'player 2 dies' do
    before do
      sign_in_and_play
      19.times {attack_helper}
      # allow(Kernel).to receive(:rand).and_return(100)
    end

    scenario 'player 2 dies' do
      expect(page).to have_content 'Larry is dead'
    end
  end
end
