require 'rails_helper'

RSpec.describe PokeType, type: :model do
  before :each do
    @poke_type = create(:poke_type)
  end

  it 'should pass if name is present' do
    expect(@poke_type).to be_valid
  end

  it 'shoud fail if name is not present' do
    @poke_type.name = nil
    expect(@poke_type).to_not be_valid
  end

  it 'shoud fail if name is duplicated' do
    new_poke_type = PokeType.new(name: @poke_type.name)
    new_poke_type.save

    expect(new_poke_type).to_not be_valid
  end
end
