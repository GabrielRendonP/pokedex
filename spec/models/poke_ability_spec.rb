require 'rails_helper'

RSpec.describe PokeAbility, type: :model do
  before :each do
    @ability = create(:poke_ability)
  end

  it 'should pass if name is present' do
    expect(@ability).to be_valid
  end

  it 'shoud fail if name is not present' do
    @ability.name = nil
    expect(@ability).to_not be_valid
  end

  it 'shoud fail if name is duplicated' do
    new_ability = PokeAbility.new(name: @ability.name)
    new_ability.save

    expect(new_ability).to_not be_valid
  end
end
