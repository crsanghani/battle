describe 'switch turns' do

 context 'seeing current turn' do

  scenario 'at the start of the game' do
    sign_in_and_play
    expect(page).to have_content "Dave's turn"
  end

   scenario 'after player_1 attacks' do
     sign_in_and_play
     click_and_attack
     expect(page).not_to have_content "Dave's turn"
     expect(page).to have_content "Mittens's turn"
   end

 end
end
