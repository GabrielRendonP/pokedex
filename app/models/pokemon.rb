class Pokemon < ApplicationRecord
  include PgSearch::Model

  belongs_to :trainer
  has_and_belongs_to_many :abilities
  has_and_belongs_to_many :poke_types

  scope :sortify, ->(sort_order) { order(created_at: sort_order) }
  scope :find_poke_by_id, ->(poke_id) { where(id: poke_id) }
  pg_search_scope :search, against: [:name],
                           using: {
                             tsearch: {
                               prefix: true
                             }
                           }
end
