require 'rails_helper'

RSpec.describe 'Add pokemons', type: :feature do
  describe 'new pokemon' do
    before(:all) do
      @user_login = create(:trainer)
      @data = create(:poke_datum)
    end

    it 'signs in and creates a pokemon' do
      visit new_trainer_session_path
      within('#new_trainer') do
        fill_in 'Email', with: @user_login.email
        fill_in 'Password', with: @user_login.password
      end
      click_button 'Log in'
      click_link 'Add new pokemon'
      expect(page).to have_content('New Pokemon')
      click_button 'Create Pokemon'
      expect(page).to have_content('pokemontest')
    end
  end
end