require 'rails_helper'

RSpec.describe Trainer, type: :model do
  before :each do
    @trainer = create(:trainer)
  end

  it 'should pass if name and email are present' do
    expect(@trainer).to be_valid
  end

  it 'shoud fail if name is not present' do
    @trainer.name = nil
    expect(@trainer).to_not be_valid
  end

  it 'shoud fail if email is not present' do
    @trainer.email = nil
    expect(@trainer).to_not be_valid
  end

  it 'should fail if name is duplicadted' do
    new_trainer = Trainer.new(name: @trainer.name, email: 'test@gmail.com', password: '123456', password_confirmation: '123456')
    new_trainer.save
    expect(new_trainer).to_not be_valid
  end

  it 'should fail if email is duplicadted' do
    new_trainer = Trainer.new(name: 'test name', email: @trainer.email, password: '123456', password_confirmation: '123456')
    new_trainer.save
    expect(new_trainer).to_not be_valid
  end

  it 'should fail if password is less than 6 characters' do
    @trainer.password = '1234'
    expect(@trainer).to_not be_valid
  end
end