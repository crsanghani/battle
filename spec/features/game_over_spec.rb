feature 'Game over' do
  context 'when player 1 reaches zero hp first' do
  before do
    sign_in_and_play
    12.times { click_and_attack }
    #allow(Kernel).to receive(:rand).and_return(60)
   end
    scenario 'player 1 loses' do
      click_link 'Attack!'
      expect(page).to have_content 'Mittens loses!'
    end
  end
end
