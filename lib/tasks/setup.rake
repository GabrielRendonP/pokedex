require_relative 'helpers/task_helpers'

task testing: :environment do
  poke_list = TaskHelpers.fetch_pokes
  abilities_list = TaskHelpers.fetch_abilities
  poke_types_list = TaskHelpers.fetch_types
  poke_types_list
  PokeDatum.create!(poke_list)
  Ability.create!(abilities_list)
  PokeType.create!(poke_types_list)
end