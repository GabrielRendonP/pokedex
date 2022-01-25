require 'rails_helper'

RSpec.describe "poke_abilities/new", type: :view do
  before(:each) do
    assign(:poke_ability, PokeAbility.new(
      name: "MyString",
      description: "MyString"
    ))
  end

  it "renders new poke_ability form" do
    render

    assert_select "form[action=?][method=?]", poke_abilities_path, "post" do

      assert_select "input[name=?]", "poke_ability[name]"

      assert_select "input[name=?]", "poke_ability[description]"
    end
  end
end
