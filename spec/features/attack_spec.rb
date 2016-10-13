require 'spec_helper'

feature 'Attacking' do
  scenario 'attack Player 2' do
    sign_in_and_play
    click_link 'Attack'
    expect(page).to have_content 'Snuggles attacked Amaal'
  end
  scenario 'reduce Player 2 HP by 10' do
    sign_in_and_play
    click_link 'Attack'
    click_button 'OK'
    expect(page).not_to have_content 'Amaal: 60HP'
    expect(page).to have_content 'Amaal: 50HP'
  end
  scenario 'attack Player 1' do
    sign_in_and_play
    click_link 'Attack'
    click_button 'OK'
    click_link 'Attack'
    expect(page).to have_content 'Amaal attacked Snuggles'
  end
end
