require 'rails_helper'

RSpec.describe "poke_abilities/edit", type: :view do
  before(:each) do
    @poke_ability = assign(:poke_ability, PokeAbility.create!(
      name: "MyString",
      description: "MyString"
    ))
  end

  it "renders the edit poke_ability form" do
    render

    assert_select "form[action=?][method=?]", poke_ability_path(@poke_ability), "post" do

      assert_select "input[name=?]", "poke_ability[name]"

      assert_select "input[name=?]", "poke_ability[description]"
    end
  end
end
