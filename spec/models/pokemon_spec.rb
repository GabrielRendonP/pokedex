require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  before :each do
    @trainer = create(:trainer)
    @pokemon = create(:pokemon, trainer_id: @trainer.id)
  end

  it 'should pass if name and trainer are present' do
    expect(@pokemon).to be_valid
  end

  it 'shoud fail if trainer is not present' do
    @pokemon.trainer_id = nil
    expect(@pokemon).to_not be_valid
  end

  it 'shoud fail if name is not present' do
    @pokemon.name = nil
    expect(@pokemon).to_not be_valid
  end

  it 'should fail if name is duplicadted' do
    new_poke = Pokemon.new(name: @pokemon.name, trainer_id: @trainer.id) 
    new_poke.save
    expect(new_poke).to_not be_valid
  end
end