class Trainer < ApplicationRecord
  has_many :pokemons, dependent: :destroy

  validates :name, presence: true
end
