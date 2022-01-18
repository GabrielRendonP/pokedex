class Pokemon < ApplicationRecord
  belongs_to :trainer
  has_and_belongs_to_many :abilities
  has_and_belongs_to_many :poke_types

  scope :find_poke_by_id, ->(poke_id) { where(id: poke_id) }
end
