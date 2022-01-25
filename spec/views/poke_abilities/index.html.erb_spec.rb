require 'rails_helper'

RSpec.describe "poke_abilities/index", type: :view do
  before(:each) do
    assign(:poke_abilities, [
      PokeAbility.create!(
        name: "Name",
        description: "Description"
      ),
      PokeAbility.create!(
        name: "Name",
        description: "Description"
      )
    ])
  end

  it "renders a list of poke_abilities" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Description".to_s, count: 2
  end
end
