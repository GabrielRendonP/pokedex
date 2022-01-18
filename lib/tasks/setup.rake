require_relative 'helpers/task_helpers'

task set_data: :environment do
  poke_list = TaskHelpers.fetch_pokes
  abilities_list = TaskHelpers.fetch_abilities
  poke_types_list = TaskHelpers.fetch_types
  PokeDatum.create!(poke_list)
  Ability.create!(abilities_list)
  PokeType.create!(poke_types_list)
end
