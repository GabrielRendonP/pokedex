require 'application_system_test_case'

class PokesTest < ApplicationSystemTestCase
  setup do
    @poke = pokes(:one)
  end

  test 'visiting the index' do
    visit pokes_url
    assert_selector 'h1', text: 'Pokes'
  end

  test 'creating a Poke' do
    visit pokes_url
    click_on 'New Poke'

    fill_in 'Name', with: @poke.name
    click_on 'Create Poke'

    assert_text 'Poke was successfully created'
    click_on 'Back'
  end

  test 'updating a Poke' do
    visit pokes_url
    click_on 'Edit', match: :first

    fill_in 'Name', with: @poke.name
    click_on 'Update Poke'

    assert_text 'Poke was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Poke' do
    visit pokes_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Poke was successfully destroyed'
  end
end
