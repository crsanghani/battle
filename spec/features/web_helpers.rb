def sign_in_and_play
  visit('/')
  fill_in :player_1_name, with: 'Snuggles'
  fill_in :player_2_name, with: 'Amaal'
  click_button 'Submit'
end

def attack_to_zero
  11.times do
    allow(Game.instance.opponent).to receive(:random_damage).and_return(10)
    click_link 'Attack'
    click_button 'OK'
  end
end
