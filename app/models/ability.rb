class Ability
  include CanCan::Ability

  def initialize(trainer)
    trainer ||= Trainer.new

    can :read, Pokemon
    can :read, Trainer

    return unless trainer.present?

    can :manage, Pokemon, trainer: trainer
    can :manage, Trainer, id: trainer.id
  end
end
