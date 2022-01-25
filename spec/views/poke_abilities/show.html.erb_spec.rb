require 'rails_helper'

RSpec.describe "poke_abilities/show", type: :view do
  before(:each) do
    @poke_ability = assign(:poke_ability, PokeAbility.create!(
      name: "Name",
      description: "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
  end
end
