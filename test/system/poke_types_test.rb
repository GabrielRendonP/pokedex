require 'application_system_test_case'

class PokeTypesTest < ApplicationSystemTestCase
  setup do
    @poke_type = poke_types(:one)
  end

  test 'visiting the index' do
    visit poke_types_url
    assert_selector 'h1', text: 'Poke Types'
  end

  test 'creating a Poke type' do
    visit poke_types_url
    click_on 'New Poke Type'

    fill_in 'Name', with: @poke_type.name
    click_on 'Create Poke type'

    assert_text 'Poke type was successfully created'
    click_on 'Back'
  end

  test 'updating a Poke type' do
    visit poke_types_url
    click_on 'Edit', match: :first

    fill_in 'Name', with: @poke_type.name
    click_on 'Update Poke type'

    assert_text 'Poke type was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Poke type' do
    visit poke_types_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Poke type was successfully destroyed'
  end
end
