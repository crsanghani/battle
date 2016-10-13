# require_relative 'welpers'
require 'spec_helper'

feature 'Switching turns' do
  context 'seeing whose turn it is' do
    scenario 'at the start of the game' do
      sign_in_and_play
      expect(page).to have_content ("Bob's turn")
    end
    scenario 'after player 1 attacks' do
      sign_in_and_play
      click_button 'ATTACK!'
      expect(page).to have_content ("Larry's turn")
    end
  end
end
